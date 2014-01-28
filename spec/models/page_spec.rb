require 'spec_helper'

describe Page do
  let(:page) { FactoryGirl.create(:page) }

  it 'is valid' do
    expect(page).to be_valid
  end

  it 'is invalid without name' do
    page.name = nil
    expect(page).not_to be_valid
  end

  it 'is invalid without body' do
    page.body = nil
    expect(page).not_to be_valid
  end
end
