class Commentstop < ActiveRecord::Base
  belongs_to :comment
  belongs_to :stop
end
