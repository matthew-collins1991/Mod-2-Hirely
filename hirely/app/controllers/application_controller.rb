class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    helper_method :user_signed_in?, :current_user

    protected

    def authenticate_user
      cookies.delete(:user_id) && redirect_to(root_url) if current_user.blank?
    end

    def current_user
      @user_account ||= User.find_by(id: cookies.signed[:user_id])
    end

    def user_signed_in?
      user_account.present?
    end
  end
