require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user,
                                  email: 'a@example.com',
                                  password: 'foobar',
                                  password_confirmation: 'foobar') }

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'does not create a user without password' do
    expect do
      User.create!(email: 'b@example.com', password: '', password_confirmation: '')
    end.to raise_error
  end

  it 'does not create user when password does not match confirmation' do
    expect do
      User.create!(email: 'b@example.com', password: 'foobar', password_confirmation: 'barfoo')
    end.to raise_error
  end

  it 'does not create a new user with same email address' do
    expect do
      User.create!(email: 'a@example.com', password: 'foobar', password_confirmation: 'foobar')
    end.to raise_error
  end
end
