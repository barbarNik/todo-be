class SnapshotSerializer < ActiveModel::Serializer
  type 'snapshot'
  attributes :auth_token
  has_one :user
  has_many :items
end
