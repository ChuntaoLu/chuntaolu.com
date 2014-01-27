class Micropost < ActiveRecord::Base
  attr_accessible :content, :tag_list
  validates :content, :tag_list, presence: true
  acts_as_taggable
  scope :desc, order('created_at DESC')

  def month_day
    created_at.strftime('%b %d')
  end
end
