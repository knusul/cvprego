class LocationSerializer < ActiveModel::Serializer
  attributes :id, :ip, :city, :country
end
