class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user = Thread.current[:user]
  end
end
