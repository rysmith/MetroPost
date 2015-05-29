class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :userlines
  has_many :lines,through: :userlines

  has_many :userstops
  has_many :stops,through: :userstops

end
