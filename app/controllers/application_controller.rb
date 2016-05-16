class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :can_be_edited?

  def can_be_edited?(object)
    ::AccessChecker.new(current_user, object).call
  end
end
