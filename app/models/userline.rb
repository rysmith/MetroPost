class Userline < ActiveRecord::Base
  belongs_to :user
  belongs_to :line

  validates :line_id, presence: true, uniqueness: true
end
