class Card < ActiveRecord::Base
  has_many :contact_types, :dependent => :destroy

  mount_uploader :photo, ImageUploader

  def photo_url
    photo.url
  end
end
