class Item < ApplicationRecord
  belongs_to :user

  has_many :hires, dependent: :destroy
  has_many :item_reviews, through: :hires
  has_one_attached :image

  validates :name, presence: true
  validates :catagory, presence: true
  validates :price, presence: true



 def self.search(search_name = '', search_category = '')
   key_name = "%#{search_name}%"
   key_category = "%#{search_category}%"
   if search_name || search_category
     self.where("name LIKE :search_name AND catagory LIKE :search_category", search_name: key_name, search_category: key_category )
   else
    self.all
   end
 end

 def distance
   Google::Maps.distance("#{self.user.location}", "#{current_user.location}")
 end

 def review
   ItemReview.select{|x| x.hire.item.id == self.id}
 end


def positive_review
self.review.select{|x| x.reaction == true}.length
end

def total_review
  self.review.length
end

def overall_score
  score = positive_review.to_f / total_review.to_f
  x = score*100
  return x.round
end

end
