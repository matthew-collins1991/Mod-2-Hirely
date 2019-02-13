class UsersController < ApplicationController
  before_action :find_user, only: [ :show,:edit, :update]
  before_action :find_items, only: [:new, :show, :create, :edit, :update]


    def show
    end

    def new
      @user = User.new
     # byebug
    end

    def create

    @user = User.new(user_params)


    if @user.save
      log_in @user
      flash[:sucess] = ['Welcome to Hirely #{@user.name}']
      redirect_to menu_path
    else
      flash[:errors] = ['something went wrong, try again']
      render 'new'
    end
  end


    def edit
      # byebug
    end

    def update

      @user.update(user_params)
      if @user.save
          flash[:sucess] = ["#{@user.first_name.capitalize} your profile has sucessfully been updated"]
        redirect_to @user
      else
        flash[:errors] = ['update unsucessful']
        render :edit

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
  end
