# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'foo'
    password 'bar'
    password_confirmation 'bar'
  end
end
