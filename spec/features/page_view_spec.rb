require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'


describe 'the page view', type: :feature  do
  let!(:user) { FactoryGirl.create(:user) }

  before { login_user_post('foo', 'bar')}

  let!(:page_1) { FactoryGirl.create(:page, name:'Test 1') }
  let!(:page_2) { FactoryGirl.create(:page, name:'Test 2') }

  context "on the pages index page" do

    before(:each) do
      visit pages_path
    end

    it 'shows the created and updated date for each page' do
      [page_1, page_2].each do |p|
        expect(page).to have_content(date_string(p.created_at, true))
        expect(page).to have_content(date_string(p.updated_at, true))
      end
    end

    it 'has link to add new page' do
      expect(page).to have_link('New Page', href: new_page_path)
    end

    it 'adds new page' do
      page.click_link('New Page')
      page.fill_in('Name', with: 'Lorem ipsum')
      page.fill_in('Body', with: 'View impressively like a lunar sun.')
      expect { page.click_button('Create Page') }.to change(Page, :count).by(1)
    end

    it 'has link to edit an page' do
      [page_1, page_2].each do |p|
        expect(page).to have_link('Edit', href: edit_page_path(p))
      end
    end

    it 'edits an page' do
      first(:link, 'Edit').click
      page.fill_in('Name', with: 'NewName')
      page.click_button('Update Page')
      expect(page).to have_content('NewName')
      expect(page).not_to have_content('Test 1')
    end

    it 'has link to delete an page' do
      [page_1, page_2].each do |p|
        expect(page).to have_link('Delete', href: page_path(p))
      end
    end

    it 'deletes an page', js: true do
      first(:link, 'Delete').click
      page.driver.browser.accept_js_confirms
      expect(current_path).to eq(pages_path)
      expect(page).not_to have_content(page_1.name)
    end
  end

  context 'on the page show page' do
    before(:each) do
      visit page_path(page_1)
    end

    # actions of 'edit' and 'delete' already tested on index page
    it 'has a link back to pages' do
      expect(page).to have_link('Back', href: pages_path)
    end

    it 'has link to edit the page' do
      expect(page).to have_link('Edit', href: edit_page_path(page_1))
    end

    describe "friendly url" do
      it 'has a friendly url' do
        slug = page_1.name.downcase.gsub(/\s+/, '-')
        expect(current_path).to eq(page_path(slug))
      end

      it 'updates url according to name update' do
        page_1.name = 'New Name'
        page_1.save
        visit page_path(page_1)
        expect(current_path).to eq(page_path('new-name'))
      end

      it 'redirect an old url to the updated url' do
        old_slug = page_1.name.downcase.gsub(/\s+/, '-')
        page_1.name = 'New Title'
        page_1.save
        visit page_path(old_slug)
        expect(current_path).to eq(page_path(page_1))
      end
    end
  end

end