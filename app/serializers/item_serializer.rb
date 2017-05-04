class ItemSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
end
