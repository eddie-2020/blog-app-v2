class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :commemts, class_name: 'Comment', foreign_key: 'user_id'
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'

  after_save :three_most_recent_posts

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
