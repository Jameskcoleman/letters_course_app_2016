class Post < ActiveRecord::Base
  include Voteable

  has_many :comments, as: :commentable

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :body, presence: true

end