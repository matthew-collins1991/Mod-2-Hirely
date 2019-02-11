class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :show, :update, :destroy]
  before_action :find_items, only: [:new, :show, :edit, :create, :update]

    def index
      @users = User.all
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user = User.create(user_params)
      redirect_to @user
    end

    def edit
      # byebug
    end

    def update
      @user.update(user_params)
        redirect_to @user
    end

    def destroy
      @user.destroy
      redirect_to users_path
    end


    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :location, :password)
    end



    def find_user
      @user = User.find(params[:id])
    end

    def find_items
      @items = Item.all
    end
  end
