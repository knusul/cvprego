class PhoneNumber < ActiveRecord::Base
  belongs_to :experience
  attr_accessible :number, :experience_id
  validates :experience_id, :presence => true
end
