class CardSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :email,
             :photo_url

  has_many :contact_types, embed: :objects
end
