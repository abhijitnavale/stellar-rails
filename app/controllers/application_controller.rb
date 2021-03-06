class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def create_log
    logger.debug params['message']
    render body: nil, status: :not_found
  end

  private

  def user_must_login
    unless session[:address].present?
      session.clear
      flash[:notice] = 'User Not Logged In OR Session Expired.'
      logger.debug '--> ALERT! User Not Logged in Or Session Expired.'
      redirect_to root_path
    end
  end
end
