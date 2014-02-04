class Micropost < ActiveRecord::Base
  attr_accessible :content, :tag_list
  validates :content, :tag_list, presence: true
  acts_as_taggable
  extend FriendlyId
  friendly_id :date, use: [:slugged, :history]
  scope :desc, order('created_at DESC')

  def date
    created_at.strftime '%F'
  end
end
