class Snapshot
  include ActiveModel::Serialization
  attr_reader :user, :auth_token

  def initialize(user, auth_token)
    @user = user
    @auth_token = auth_token
  end
end