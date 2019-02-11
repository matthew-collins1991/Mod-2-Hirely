class HiresController < ApplicationController

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


  private

  def hire_params
    params.permit(:user_id, :item_id, :hired)
  end






end
