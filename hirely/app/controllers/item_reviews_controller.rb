class ItemReviewsController < ApplicationController
before_action :find_item_review, only: [:show]

  def new
    @item_review = ItemReview.new
  end

  def create

    @item_review = ItemReview.create(item_review_params)

    if  !!item_review_params[:reaction] && @item_review.save
    redirect_to @item_review, success: "Your new review has been created"
  else
    redirect_to hire_path(@item_review.hire_id), danger: "Something went wrong, please try again"
  end
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
