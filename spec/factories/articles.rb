# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "Test"
    body "Where is the ugly"
    tag_list "test, blog"
  end
end
