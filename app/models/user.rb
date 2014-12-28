class User < ActiveRecord::Base
  before_create :generate_token
  validates_presence_of :email, :password, :user_name
  validates_uniqueness_of :email, :user_name

  has_secure_password validations: false

  has_many :posts
  has_many :comments
  has_many :letters

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end