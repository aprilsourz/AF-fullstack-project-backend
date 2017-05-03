class ItemSerializer < ActiveModel::Serializer
  attributes :id, :content, :users
end
