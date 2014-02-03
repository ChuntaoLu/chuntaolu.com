require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'


describe 'the article view', type: :feature do
  let!(:user) { FactoryGirl.create(:user) }

  before { login_user_post('foo', 'bar')}

  let!(:article_1) { FactoryGirl.create(:article, title:'Test 1', tag_list: 'baz') }
  let!(:article_2) { FactoryGirl.create(:article, title:'Test 2', tag_list: 'baz, quxx') }

  context "on the articles index page" do

    before(:each) do
      visit articles_path
    end

    it 'shows articles in descending order' do
      expect(page.body).to match(/Test 2.*Test 1/m)
    end

    it 'shows the created date for each article' do
      [article_1, article_2].each do |article|
        expect(page).to have_content(date_string(article.created_at, true))
      end
    end

    it 'links titles to the articles' do
      [article_1, article_2].each do |article|
        expect(page).to have_link(article.title, href: article_path(article))
      end
    end

    it 'has link to add new article' do
      expect(page).to have_link('New Article', href: new_article_path)
    end

    it 'adds new article' do
      page.click_link('New Article')
      page.fill_in('Title', with: 'Lorem ipsum')
      page.fill_in('Body', with: 'View impressively like a lunar sun.')
      page.fill_in('Tags (separated by commas)', with: 'life')
      expect { page.click_button('Create Article') }.to change(Article, :count).by(1)
    end

    it 'has link to edit an article' do
      [article_1, article_2].each do |article|
        expect(page).to have_link('Edit', href: edit_article_path(article))
      end
    end

    it 'edits an article' do
      first(:link, 'Edit').click
      page.fill_in('Title', with: 'NewTitle')
      page.click_button('Update Article')
      expect(page).to have_content('NewTitle')
      expect(page).not_to have_content('Test 1')
    end

    it 'has link to delete an article' do
      [article_1, article_2].each do |article|
        expect(page).to have_link('Delete', href: article_path(article))
      end
    end

    it 'deletes an article', js: true do
      first(:link, 'Delete').click
      page.driver.browser.accept_js_confirms
      expect(current_path).to eq(articles_path)
      expect(page).not_to have_content(article_2.title)
    end

    describe "article tags" do
      it 'shows the article tags' do
        [article_1, article_2].each do |article|
          article.tag_list.each do |tag|
            expect(page).to have_link(tag, href: articles_tag_path(tag))
          end
        end
      end

      it 'shows tagged articles after a tag is clicked' do
        first(:link, 'baz').click
        expect(current_path).to eq(articles_tag_path('baz'))
        expect(page).to have_content(article_1.title)
        expect(page).to have_content(article_2.title)
      end

      it 'does not show unrelated article when a tag is clicked' do
        click_link('quxx')
        expect(current_path).to eq(articles_tag_path('quxx'))
        expect(page).not_to have_content(article_1.title)
        expect(page).to have_content(article_2.title)
      end
    end

    describe "archive" do
      before(:each) do
        article_1.created_at = 1.year.ago
        article_1.save
      end

      it 'has a link to archives' do
        expect(page).to have_link('Archive', href: archive_articles_path)
      end

      it 'shows archive articles grouped by year' do
        page.click_link('Archive')
        expect(current_path).to eq(archive_articles_path)
        [article_1, article_2].each do |article|
          expect(page).to have_content(article.created_at.year)
          expect(page).to have_content(date_string(article.created_at))
          expect(page).to have_link(article.title, href: article_path(article))
        end
      end
    end
  end

  context 'on the article show page' do
    before(:each) do
      visit article_path(article_1)
    end

    it 'shows the created date for the article' do
        expect(page).to have_content(date_string(article_1.created_at, true))
    end

    # actions of 'edit' and 'delete' already tested on index page
    it 'has a link back to articles' do
      expect(page).to have_link('Back', href: articles_path)
    end

    it 'has link to edit the article' do
      expect(page).to have_link('Edit', href: edit_article_path(article_1))
    end

    it 'has links of its tags' do
      article_1.tag_list.each do |tag|
        expect(page).to have_link(tag, href: articles_tag_path(tag))
      end
    end

    describe "friendly url" do
      it 'has a friendly url' do
        slug = article_1.title.downcase.gsub(/\s+/, '-')
        expect(current_path).to eq(article_path(slug))
      end

      it 'updates url according to title update' do
        article_1.title = 'New Title'
        article_1.save
        visit article_path(article_1)
        expect(current_path).to eq(article_path('new-title'))
      end

      it 'redirect an old url to the updated url' do
        old_slug = article_1.title.downcase.gsub(/\s+/, '-')
        article_1.title = 'New Title'
        article_1.save
        visit article_path(old_slug)
        expect(current_path).to eq(article_path(article_1))
      end
    end
  end

end