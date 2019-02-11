class SessionsController < ApplicationController

    def new
      # render the login form
    end

    def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
log_out
redirect_to root_url
end


    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :location, :password)
    end

  end
