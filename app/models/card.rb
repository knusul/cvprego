class Card < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  has_many :contact_types, :dependent => :destroy

  mount_uploader :photo, ImageUploader

  def photo_url
    photo.url
  end
end
