require 'spec_helper'

describe Mooc do
  let(:mooc) { FactoryGirl.create(:mooc) }

  it 'is valid' do
    expect(mooc).to be_valid
  end

  it 'is invalid without name' do
    mooc.name = nil
    expect(mooc).not_to be_valid
  end

  it 'is invlid without a platform' do
    mooc.platform = nil
    expect(mooc).not_to be_valid
  end
end
