class VisitSerializer < ActiveModel::Serializer
  attributes :date, :id, :count, :location_ids
  embed :ids, :include => true

  has_many :locations
end
