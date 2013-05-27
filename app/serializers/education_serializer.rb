class EducationSerializer < ActiveModel::Serializer
  attributes :id,
             :from_date,
             :to_date,
             :name
end
