class Mooc < ActiveRecord::Base
  attr_accessible :course_link, :finish_date, :name, :platform, :provider, :statement_link
  validates :name, :platform, presence: true
end
