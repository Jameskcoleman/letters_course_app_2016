class Post < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :comments, as: :commentable

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :body, presence: true

  index_name "blog-engine-#{Rails.env}"

  mapping do
    indexes :id, index: :not_analyzed
    indexes :title, analyzer: 'snowball', boost: 100
    indexes :body, analyzer: 'snowball'
    indexes :created_at, type: 'date', index: :not_analyzed
  end

  def to_indexed_json
    {
      id: id,
      title: title,
      body: body,
      created_at: created_at
    }.to_json
  end

end