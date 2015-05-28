class Comment < ActiveRecord::Base

  has_many :commentlines
  has_many :lines,through: :commentlines

  has_many :commentstops
  has_many :stops,through: :commentstops

end
