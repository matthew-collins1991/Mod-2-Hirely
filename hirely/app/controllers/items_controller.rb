class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :show, :update, :destroy]
  before_action :find_users, only: [:new, :edit, :create, :update]
  before_action :require_login, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @items = Item.search(params['search_name'], params['search_category'])
  end

  def show
  end

  def new

    @item = Item.new
  end

  def create

    @item = Item.create(item_params)
    redirect_to @item, success: "Your new item has been create"
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to @item, info: "Your item has been update"
  end

  def destroy
    @item.destroy
    redirect_to items_path, info: "Your item has been deleted"
  end

  private

  def item_params

    params.require(:item).permit(:name, :price, :description, :catagory, :search, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def find_users
    @users = User.all
  end

  def require_login
    authorized?
  end
end
