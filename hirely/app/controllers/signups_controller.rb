class SignupsController < ApplicationController

  def new
    @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        cookies.signed[:user_id] = @user.id
        redirect_to items_path
      else
        render :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :location, :password)
    end
  end
