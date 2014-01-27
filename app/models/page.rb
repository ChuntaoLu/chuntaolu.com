class Page < ActiveRecord::Base
  attr_accessible :body, :name
  validates :name, :body, presence: true
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
