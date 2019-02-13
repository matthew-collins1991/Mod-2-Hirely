class Item < ApplicationRecord
  belongs_to :user
  has_many :hires, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :catagory, presence: true
  validates :price, presence: true



 def self.search(search)
   if search
     self.where("name LIKE?", "%#{search}%")
   else
    self.all
   end
 end

 def catagory_list
   cat_list = ['Beauty','Garden','Home','Kitchen','Car']
 end



end
