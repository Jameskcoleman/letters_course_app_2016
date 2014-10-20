class Post < ActiveRecord::Base
  has_many :comments, as: :commentable

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :body, presence: true

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
  end

end