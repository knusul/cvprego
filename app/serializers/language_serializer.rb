class LanguageSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :level
end
