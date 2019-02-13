class SessionsController < ApplicationController

    def new
      # render the login form
    end

    def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to menu_path, info: "Welcome back #{user.first_name.capitalize}"
    else
      redirect_to login_path, danger: 'Invalid email or password'
    end
  end


  def destroy
log_out
redirect_to root_url, info: "You are logged out"
end


    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :location, :password)
    end

  end
