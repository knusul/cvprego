class Card < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  has_many :contact_types, :dependent => :destroy
end
