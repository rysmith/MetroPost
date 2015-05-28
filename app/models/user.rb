class User < ActiveRecord::Base

  has_many :userlines
  has_many :lines,through: :userlines

end
