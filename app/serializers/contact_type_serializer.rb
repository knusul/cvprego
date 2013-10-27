class ContactTypeSerializer < ActiveModel::Serializer
  attributes :id, :number, :name, :card_id
  def card_id
      "singleton"
  end
end
