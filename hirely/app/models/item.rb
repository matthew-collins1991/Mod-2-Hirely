class Item < ApplicationRecord
  belongs_to :user
  has_many :hires


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
