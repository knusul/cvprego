class ExperienceSerializer < ActiveModel::Serializer
  attributes :id,
             :from_date,
             :to_date,
             :email,
             :notes

  has_many :contact_types, embed: :objects
end
