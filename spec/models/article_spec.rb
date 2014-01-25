require 'spec_helper'

describe Article do
  let(:article) { FactoryGirl.create(:article) }

  it 'is valid' do
    expect(article).to be_valid
  end

  it 'is invalid without a title' do
    article.title = nil
    expect(article).not_to be_valid
  end

  it 'is invalid without a body' do
    article.body = nil
    expect(article).not_to be_valid
  end

  it 'is invalid without a tag_list' do
    article.tag_list = nil
    expect(article).not_to be_valid
  end
end

