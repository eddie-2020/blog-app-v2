class Post < ApplicationRecord
  belongs_to :users
  has_many :commemts
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    users.increment!(:posts_counter)
  end

  def five_most_recent_comments
    commemts.order(created_at: :desc).limit(5)
  end
end
