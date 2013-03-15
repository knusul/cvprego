class ExperienceSerializer < ActiveModel::Serializer
  attributes :id,
             :from_date,
             :to_date,
             :email,
             :notes

end
