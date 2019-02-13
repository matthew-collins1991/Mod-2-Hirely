class Item < ApplicationRecord
  belongs_to :user
  has_many :hires, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :catagory, presence: true
  validates :price, presence: true



 def self.search(search)
   key = "%#{search}%"
   if search
     self.where("name LIKE :search OR catagory LIKE :search", search: key )
   else
    self.all
   end
 end


end
