class Comment < ActiveRecord::Base

  has_many :commentlines
  has_many :lines, through: :commentlines

end
