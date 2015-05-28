class Userline < ActiveRecord::Base
  belongs_to :user
  belongs_to :line
end
