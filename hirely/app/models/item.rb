class Item < ApplicationRecord
  belongs_to :user
  has_many :hires, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :catagory, presence: true
  validates :price, presence: true


  def self.search(search)

     if search
       item = Item.find_by(name: search)
         if item
             self.where(name: item)
         else
           Item.all
         end
     else
       Item.all

     end
 end


end
