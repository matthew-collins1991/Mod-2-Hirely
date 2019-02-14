class ItemReviewsController < ApplicationController
before_action :find_item_review, only: [:show]

  def new
    @item_review = ItemReview.new
  end

  def create

    @item_review = ItemReview.create(item_review_params)
    redirect_to @item_review
  end

  def show
  end

private

  def item_review_params
    params.permit(:hire_id, :reaction, :content)
  end

  def find_item_review
    @item_review = ItemReview.find(params[:id])
  end
end
