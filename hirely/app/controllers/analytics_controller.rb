class AnalyticsController < ApplicationController

def index
@users = User.all
@items = Item.all
@hires = Hire.all
@item_reviews = ItemReview.all
end


end
