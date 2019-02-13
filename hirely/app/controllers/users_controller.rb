class UsersController < ApplicationController
  before_action :find_user, only: [ :show,:edit, :update]
  before_action :find_items, only: [:new, :show, :create, :edit, :update]
  before_action :require_login, only: [:show, :edit, :update, :destroy]

    def show
      authorized_for(params[:id])
    end

    def new
      @user = User.new
     # byebug
    end

    def create
    @user = User.new(user_params)
    if @user.save

      log_in @user
      # flash[:sucess] = ["Welcome to Hirely #{@user.first_name.capitalize}"]
      redirect_to menu_path, info: "Welcome to Hirely #{@user.first_name.capitalize}"

    else
      # flash[:error] = ['Something went wrong, try again']
      redirect_to new_user_path, danger: "Something went wrong, please try again"
    end
  end


    def edit
      # byebug
    end

    def update

      @user.update(user_params)
      if @user.save
          # flash[:sucess] = ["#{@user.first_name.capitalize} your profile has sucessfully been updated"]
        redirect_to @user, success: "#{@user.first_name.capitalize} your profile has sucessfully been updated"
      else
        # flash[:error] = ["update unsucessful"]

        redirect_to edit_user_path(@user), danger: "Update unsuccessful"

      end
    end

    # def destroy
    #   @user.destroy
    #   redirect_to users_path
    # end


    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :location, :password, :password_confirmation, :profile_pic)
    end



    def find_user
      @user = User.find(params[:id])
    end

    def find_items
      @items = Item.all
    end

    def require_login
      authorized?
    end
  end
