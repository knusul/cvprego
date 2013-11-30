class Location < ActiveRecord::Base
  belongs_to :visit
  validate :all_fields_cannot_be_nil

  def all_fields_cannot_be_nil
    unless attributes.slice('country', 'city', "longitude", 'latitude', "ip").any?{|_,v| v.present?}
      errors.add(:base, "at least one of fields has to be present")
    end
  end
end
