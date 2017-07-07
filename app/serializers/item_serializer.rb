class ItemSerializer < ActiveModel::Serializer
  attributes :id, :text, :done, :created_at
end
