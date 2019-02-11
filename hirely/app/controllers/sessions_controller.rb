class SessionsController < ApplicationController

    def new
      # render the login form
    end

    def create
      @user = User.find_by("LOWER(email) = ?", user_params[:email].downcase)

      if @user.present? && @user.authenticate(user_params[:password])
        cookies.permanent.signed[:user_id] = @user.id
        redirect_to items_path
      else
        render :new
      end
    end

    def destroy
      cookies.delete(:user_id)
      redirect_to root_url
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :location, :password)
    end

  end
