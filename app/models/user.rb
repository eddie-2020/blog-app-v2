class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :name, length: { minimum: 1 }

  ROLES = %i[admin moderator author banned].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  def recent_posts
    posts.order('created_at Asc').limit(3)
  end
end
