class Comment < ActiveRecord::Base

  has_many :commentlines
  has_many :lines,through: :commentlines

  has_many :commentstops
  has_many :stops,through: :commentstops

  belongs_to :user

  accepts_nested_attributes_for :lines

end
