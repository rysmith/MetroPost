class Stop < ActiveRecord::Base

  has_many :userstops
  has_many :users,through: :userstops

  has_many :commentstops
  has_many :comments,through: :commentstops

end
