class Letter < ActiveRecord::Base
  has_many :comments, as: :commentable

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true
  validates :body, presence: true
end