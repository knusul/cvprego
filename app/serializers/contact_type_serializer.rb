class ContactTypeSerializer < ActiveModel::Serializer
  attributes :id, :number, :card_id
end
