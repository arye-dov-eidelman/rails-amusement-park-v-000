class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :validate_session
  skip_before_action :validate_session, only: :home

  def home

  end

  private

  def log_in(user_id)
    session[:user_id] = user_id
  end

  def current_user
    session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def logged_out?
    !current_user
  end

  def log_out
    session.delete(:user_id)
  end

  def validate_session
    if logged_out?
      redirect_to root_path
    end
  end
end
