class Article < ActiveRecord::Base
  attr_accessible :body, :title, :tag_list
  validates :title, :body, :tag_list, presence: true
  acts_as_taggable
end
