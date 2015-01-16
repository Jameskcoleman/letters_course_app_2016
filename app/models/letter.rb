class Letter < ActiveRecord::Base
  include Voteable

  has_many :comments, as: :commentable
  belongs_to :assignment
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true
  validates :body, presence: true
end