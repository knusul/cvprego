class ContactType < ActiveRecord::Base
  belongs_to :card
  attr_accessible :number, :name, :card_id
  validates :card_id, :presence => true
end
