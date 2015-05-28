class Userstop < ActiveRecord::Base
  belongs_to :user
  belongs_to :stop
end
