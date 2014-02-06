require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'


describe 'the micropost view', type: :feature do
  let!(:user) { FactoryGirl.create(:user) }

  before { login_user_post('foo', 'bar')}

  let!(:micropost_1) { FactoryGirl.create(:micropost, content: 'first post', tag_list: 'baz') }
  let!(:micropost_2) { FactoryGirl.create(:micropost, content: 'second post', tag_list: 'baz, quxx') }

  before(:each) do
    visit microposts_path
  end

  it 'shows microposts in descending order' do
    expect(page.body).to match(/second post.*first post/m)
  end

  it 'shows the created date for each micropost' do
    [micropost_1, micropost_2].each do |micropost|
      expect(page).to have_content(date_string(micropost.created_at))
    end
  end

  it 'has link to add new micropost' do
    expect(page).to have_link('New Micro', href: new_micropost_path)
  end

  it 'adds new micropost' do
    page.click_link('New Micro')
    page.fill_in('Content', with: 'View impressively like a lunar sun.')
    page.fill_in('Tags (separated by commas)', with: 'life')
    expect { page.click_button('Create Micropost') }.to change(Micropost, :count).by(1)
  end

  it 'has link to edit an micropost' do
    [micropost_1, micropost_2].each do |micropost|
      expect(page).to have_link('Edit', href: edit_micropost_path(micropost))
    end
  end

  it 'edits an micropost' do
    first(:link, 'Edit').click
    page.fill_in('Content', with: 'Some new stuff')
    page.click_button('Update Micropost')
    expect(page).to have_content('Some new stuff')
    expect(page).not_to have_content('second post')
  end

  it 'has link to delete an micropost' do
    [micropost_1, micropost_2].each do |micropost|
      expect(page).to have_link('Delete', href: micropost_path(micropost))
    end
  end

  it 'deletes an micropost', js: true do
    first(:link, 'Delete').click
    page.driver.browser.accept_js_confirms
    expect(current_path).to eq(microposts_path)
    expect(page).not_to have_content(micropost_2.content)
  end

  describe "micropost tags" do
    it 'shows the micropost tags' do
      [micropost_1, micropost_2].each do |micropost|
        micropost.tag_list.each do |tag|
          expect(page).to have_link(tag, href: microposts_tag_path(tag))
        end
      end
    end

    it 'shows tagged microposts after a tag is clicked' do
      first(:link, 'baz').click
      expect(current_path).to eq(microposts_tag_path('baz'))
      expect(page).to have_content(micropost_1.content)
      expect(page).to have_content(micropost_2.content)
    end

    it 'does not show unrelated micropost when a tag is clicked' do
      click_link('quxx')
      expect(current_path).to eq(microposts_tag_path('quxx'))
      expect(page).not_to have_content(micropost_1.content)
      expect(page).to have_content(micropost_2.content)
    end
  end

end


