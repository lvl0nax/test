class AccessChecker
  attr_reader :user, :object

  def initialize(user, object)
    @user = user
    @object = object
  end

  def call
    return false unless user
    if object.is_a? Comment
      return false if object.created_at < 15.minutes.ago
    end
    object.user_id == user.id
  end
end
