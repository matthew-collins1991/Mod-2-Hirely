class HiresController < ApplicationController
  before_action :find_hire, only: [:update]
  before_action :require_login, only: [:show, :new, :create, :update]

  def show
    @hire = Hire.find(params[:id])
  end

  def new
      @hire = Hire.new
  end

  def create
      @hire = Hire.new(hire_params)
    # @hire.user_id = current_user.id
      if @hire.valid?
        @hire.save
        redirect_to @hire
      else
        render :new
      end
  end

  def update
    @hire.update(hire_params)
      redirect_to @hire
  end


  private

  def hire_params
    params.permit(:user_id, :item_id, :hired)
  end

  def find_hire
    @hire = Hire.find(params[:id])
  end

  def require_login
    authorized?
  end




end
