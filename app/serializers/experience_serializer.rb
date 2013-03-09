class ExperienceSerializer < ActiveModel::Serializer
  attributes :id,
             :from_date,
             :to_date,
             :email,
             :notes

  has_many :phone_numbers, embed: :objects
end
