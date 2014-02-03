namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_articles
    make_microposts
    make_moocs
    make_page
  end
end

def make_articles
  50.times do
    title = Faker::Lorem.sentence()
    content = Faker::Lorem.paragraph(sentence_count = 10, supplemental = true, random_sentences_to_add = 60)
    tag_list = Faker::Lorem.words(3)
    article = Article.create!(title: title, body: content, tag_list: tag_list)
    article.created_at = (1..30).to_a.sample.months.ago
    article.save
  end
end

def make_microposts
  50.times do
    content = Faker::Lorem.sentence(word_count = 10, supplemental = true, random_words_to_add = 10)
    tag_list = Faker::Lorem.words(3)
    Micropost.create!(content: content, tag_list: tag_list)
  end
end

def make_moocs
  10.times do
    name = Faker::Lorem.sentence(word_count = 5, supplemental = true, random_words_to_add = 3)
    finish_date = (2..15).to_a.sample.months.ago
    platform = ['Edx', 'Coursera', 'Udacity'].sample
    Mooc.create!(name: name, finish_date: finish_date, platform: platform)
  end
end

def make_page
  Page.create!(name: 'About', body: 'There is nothing here...')
end
