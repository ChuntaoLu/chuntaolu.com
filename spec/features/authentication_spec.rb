require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'

describe 'the application', type: :feature do

  context 'when logged out' do

    it 'can access articles index, show and archives' do
      Article.create!(title: 'Foo', body: 'Bar', tag_list: 'baz')
      [articles_path, article_path('foo'), archives_articles_path].each do |path|
        visit path
        expect(current_path).to eq(path)
      end
    end

    it 'can access microposts and moocs' do
      [microposts_path, moocs_path].each do |path|
        visit path
        expect(current_path).to eq(path)
      end
    end

    it 'can access Page show pages' do
      Page.create!(name: 'Foo', body: 'bar')
      visit page_path('foo')
      expect(current_path).to eq(page_path('foo'))
    end

    it 'does not have a link to logout' do
      visit root_path
      expect(page).not_to have_link('Logout', href: logout_path)
    end

    it 'can not view users index and pages' do
      [users_path, pages_path].each do |path|
        visit path
        expect(current_path).to eq(root_path)
      end
    end

    it 'can not create stuff' do
      [new_article_path, new_micropost_path, new_mooc_path,
       new_page_path, new_user_path].each do |path|
        visit path
        expect(current_path).to eq(root_path)
      end
    end
  end

  context 'when logged in' do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      login_user_post('foo', 'bar')
    end

    it 'has a logout link' do
      expect(page).to have_link('Log out', href: logout_path)
    end

    it 'does not have a log in link' do
      expect(page).not_to have_link('Login', href: login_path)
    end

    it 'has a link to pages' do
      expect(page).to have_link('Pages', href: pages_path)
    end

    it 'has a link to users' do
      expect(page).to have_link('Users', href: users_path)
    end

    it 'adds a new article' do
      visit new_article_path
      page.fill_in('Title', with: 'Joe')
      page.fill_in('Body', with: 'Johnson')
      page.fill_in('Tags (separated by commas)', with: 'NBA')
      expect { page.click_button('Create Article') }.to change(Article, :count).by(1)
      expect(page.body).to match(/Joe.*Johnson/m)
    end

    it 'adds a new micropost' do
      visit new_micropost_path
      page.fill_in('Content', with: 'bar')
      page.fill_in('Tags (separated by commas)', with: 'foo')
      expect { page.click_button('Create Micropost') }.to change(Micropost, :count).by(1)
      expect(page).to have_content('bar')
    end

    it 'adds a new page' do
      visit new_page_path
      page.fill_in('Name', with: 'Foo')
      page.fill_in('Body', with: 'Bar')
      expect { page.click_button('Create Page') }.to change(Page, :count).by(1)
      expect(page.body).to match(/Foo.*Bar/m)
    end
  end
end