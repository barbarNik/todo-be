class Snapshot
  include ActiveModel::Serialization
  attr_reader :user, :auth_token, :items

  def initialize(user, auth_token, items)
    @user = user
    @auth_token = auth_token
    @items = items
  end
end