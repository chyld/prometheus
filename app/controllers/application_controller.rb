class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize
  private
  def authorize
    @auth = User.find(session[:user_id]) if session[:user_id].present?
  end
end
