class ContactType < ActiveRecord::Base
  belongs_to :card
  attr_accessible :number, :card_id
  validates :card_id, :presence => true
end
