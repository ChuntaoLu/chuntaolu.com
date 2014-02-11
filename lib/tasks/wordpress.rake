namespace :db do
  desc "Fill database with wordpress posts"
  task wordpress: :environment do
    import_wordpress
  end
end

def import_wordpress
  f = File.open(Rails.root.join('lib', 'tasks', "wordpress.xml"), 'r')
  doc = Nokogiri::XML(f)
  items = doc.xpath('//item')
  items.each do |item|
    title = item.at_xpath('title').text
    created_date = Time.parse(item.at_xpath('pubDate').text)
    tag = item.xpath('category[@domain="category"]').attr('nicename').text
    content = item.xpath('content:encoded').text
    content.gsub!(/\[code[^\]]*\]/, "\n```python")
    content.gsub!(/\[\/code\]/, '```')
    content.gsub!(/\$Latex ([^\$]*)\$/, '\1')
    content.gsub!(/\s*<li>/, '<li>')
    content.gsub!(/\t/, '    ')
    content.gsub!(/<!--more-->/, '')
    content.gsub!(/&quot;/, '"')
    content.gsub!(/<\/ol>\n/, '</ol>')
    content.gsub!(/<\/ul>\n/, '</ul>')
    content.gsub!(/<\/li>\n/, '</li>')
    article = Article.create(title: title, body: content, tag_list: tag)
    article.created_at = created_date
    article.updated_at = created_date
    article.save!
  end
  f.close()
end