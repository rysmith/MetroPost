class Commentline < ActiveRecord::Base
  belongs_to :comment
  belongs_to :line
end
