class User < ActiveRecord::Base

  #hashing of password_digest?
  has_secure_password

  #goal? receive user data, validate it, POST to the db
  #it seems to still output true even if a 'presence: true' condition fails
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, length: { in: 8..15 },
            confirmation: true

  #the model defines the relationships between the different tables

  #each user can have many metro lines
  #:userlines is a join table
  has_many :userlines

  #connects the User model (current) to the Line model
  #the User-Line connections is via UserLine joint model
  has_many :lines,through: :userlines

  #each user can have many metro stops
  #User Model => Users Table
  #Stop Model => Stops Table
  #connects the User model (current) to the Stop model
  #the User-Line connections is via UserStop joint model
  has_many :userstops
  has_many :stops,through: :userstops

  has_many :comments

end
