class ContactType < ActiveRecord::Base
  belongs_to :card
  validates :card_id, :presence => true
end
