class User < ApplicationRecord
  has_many :item
  has_many :hires
  has_many :item_reviews, through: :hires
  # has_secure_password
  validates :email, presence: true, uniqueness: true

 def name
   "#{self.first_name} #{self.last_name}"
 end
end
