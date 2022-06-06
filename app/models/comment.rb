class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  after_save :update_comments_counter

  def update_comments_counter
    posts.order(created_at: :desc).limit(3)
  end
end
