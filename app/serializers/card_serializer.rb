class CardSerializer < ActiveModel::Serializer
  embed :ids, :include => true
  attributes :id,
             :first_name,
             :last_name,
             :email,
             :photo_url,
             :contact_type_ids

  has_many :contact_types
end
