class Line < ActiveRecord::Base

  has_many :userlines
  has_many :users, through: :userlines

  has_many :commentlines
  has_many :comments, through: :commentlines

end
