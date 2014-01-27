class Micropost < ActiveRecord::Base
  attr_accessible :content, :tag_list
  validates :content, :tag_list, presence: true
  acts_as_taggable
  scope :desc, order('created_at DESC')
end
