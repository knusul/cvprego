class ContactTypeSerializer < ActiveModel::Serializer
  attributes :id, :number, :name, :card_id
end
