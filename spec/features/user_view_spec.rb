require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'


describe 'the user view' do
  let!(:user_1) { FactoryGirl.create(:user, email: 'a@x.com', password: 'foo', password_confirmation: 'foo') }
  let!(:user_2) { FactoryGirl.create(:user, email: 'b@x.com', password: 'bar', password_confirmation: 'bar') }

  context "on the users index page" do

    before(:each) do
      visit users_path
    end

    it 'shows the created and updated date for each user' do
      [user_1, user_2].each do |user|
        expect(page).to have_content(date_string(user.created_at, true))
        expect(page).to have_content(date_string(user.updated_at, true))
      end
    end

    it 'has link to add new user' do
      expect(page).to have_link('New User', href: new_user_path)
    end

    it 'adds new user' do
      page.click_link('New User')
      page.fill_in('Email', with: 'c@x.com')
      page.fill_in('Password', with: 'baz')
      page.fill_in('Password confirmation', with: 'baz')
      expect { page.click_button('Create User') }.to change(User, :count).by(1)
    end

    it 'has link to edit an user' do
      [user_1, user_2].each do |user|
        expect(page).to have_link('Edit', href: edit_user_path(user))
      end
    end

    it 'edits an user' do
      first(:link, 'Edit').click
      page.fill_in('Email', with: 'd@x.com')
      page.click_button('Update User')
      expect(page).to have_content('d@x.com')
      expect(page).not_to have_content('a@x.com')
    end

    it 'has link to delete an user' do
      [user_1, user_2].each do |user|
        expect(page).to have_link('Delete', href: user_path(user))
      end
    end

    it 'deletes an user', js: true do
      first(:link, 'Delete').click
      page.driver.browser.accept_js_confirms
      expect(current_path).to eq(users_path)
      expect(page).not_to have_content(user_1.email)
    end
  end

end