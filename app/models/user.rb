class User < ActiveRecord::Base
  validates_presence_of :email, :password, :user_name
  validates_uniqueness_of :email, :user_name

  has_secure_password validations: false

  has_many :posts
  has_many :comments
  has_many :letters
end