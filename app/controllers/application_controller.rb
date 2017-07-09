class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  def current_user
    return User.find(cookies[:user_id])
  end
end
