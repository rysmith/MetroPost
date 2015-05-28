class User < ActiveRecord::Base

  has_many :userlines
  has_many :lines,through: :userlines

  has_many :userstops
  has_many :stops,through: :userstops

end
