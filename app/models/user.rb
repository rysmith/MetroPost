class User < ActiveRecord::Base

  #hashing of password_digest?
  has_secure_password

  #receive user data, validate it, POST to the db
  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 50 }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 50},
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  #password must be at least 8 chars with one number and one letter
  validates :password,
            presence: true,
            format: { with: /(?=.*[a-zA-Z])(?=.*[0-9]).{8,}/ },
            length: { maximum: 50 },
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
