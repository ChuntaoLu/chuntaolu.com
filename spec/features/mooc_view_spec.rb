require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'


describe 'the mooc view', type: :feature do
  let!(:user) { FactoryGirl.create(:user) }

  before { login_user_post('foo', 'bar')}

  let!(:mooc_1) { FactoryGirl.create(:mooc, name: 'first course',
                                     platform: 'Edx', finish_date: 5.months.ago) }
  let!(:mooc_2) { FactoryGirl.create(:mooc, name: 'second course',
                                     platform: 'Coursera', finish_date: 2.months.ago) }
  let!(:mooc_3) { FactoryGirl.create(:mooc, name: 'third course',
                                     platform: 'Coursera', finish_date: 1.year.ago) }

  before(:each) do
    visit moocs_path
  end

  it 'shows moocs in platform groups' do
    expect(page.body).to match(/Coursera.*second course.*Edx.*first course/m)
  end

  it 'shows moocs in ascending order of the finish date' do
    expect(page.body).to match(/third course.*second course/m)
  end

  it 'has link to add new mooc' do
    expect(page).to have_link('New Mooc', href: new_mooc_path)
  end

  it 'adds new mooc' do
    page.click_link('New Mooc')
    page.fill_in('Name', with: 'new course')
    page.fill_in('Platform', with: 'Audacity')
    expect { page.click_button('Create Mooc') }.to change(Mooc, :count).by(1)
  end

  it 'has link to edit an mooc' do
    [mooc_1, mooc_2].each do |mooc|
      expect(page).to have_link('Edit', href: edit_mooc_path(mooc))
    end
  end

  it 'edits an mooc' do
    first(:link, 'Edit').click
    page.fill_in('Name', with: 'another course')
    page.click_button('Update Mooc')
    expect(page).to have_content('another course')
    expect(page).not_to have_content('third course')
  end

  it 'has link to delete an mooc' do
    [mooc_1, mooc_2].each do |mooc|
      expect(page).to have_link('Delete', href: mooc_path(mooc))
    end
  end

  it 'deletes an mooc', js: true do
    first(:link, 'Delete').click
    page.driver.browser.accept_js_confirms
    expect(current_path).to eq(moocs_path)
    expect(page).not_to have_content(mooc_3.name)
  end

end


