class Card < ActiveRecord::Base
  has_many :contact_types, :dependent => :destroy
  has_many :visits, :dependent => :destroy

  mount_uploader :photo, ImageUploader
  accepts_nested_attributes_for :contact_types

  def photo_url
    photo.url
  end
end
