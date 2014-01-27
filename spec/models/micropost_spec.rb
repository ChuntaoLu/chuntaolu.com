require 'spec_helper'

describe Micropost do
  let(:micropost) { FactoryGirl.create(:micropost) }

  it 'is valid' do
    expect(micropost).to be_valid
  end

  it 'is invalid without content' do
    micropost.content = nil
    expect(micropost).not_to be_valid
  end

  it 'is invlid without a tag list' do
    micropost.tag_list = nil
    expect(micropost).not_to be_valid
  end
end

