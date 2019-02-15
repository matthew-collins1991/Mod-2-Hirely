class User < ApplicationRecord
  has_many :item
  has_many :hires
  has_many :item_reviews, through: :hires
  has_one_attached :profile_pic

#-----------------------validations---------------------------
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  validate :validate_postcode

  def validate_postcode
    ukpc = UKPostcode.parse(location)
    if ukpc.full_valid?
      location = ukpc
    else
      errors.add(:location, "not recognised as a UK postcode")
    end
  end
#------------------------validations--------------------------




  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end



  def location=(str)
    super UKPostcode.parse(str).to_s
  end

 def name
   "#{self.first_name.capitalize} #{self.last_name.capitalize}"
 end

 def hired
   Hire.all.select{|x| x.user_id == self.id}
 end

end
