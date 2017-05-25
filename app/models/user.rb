class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
		 :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :post_upvotes, through: :posts
  has_many :post_downvotes, through: :posts
  has_many :comment_upvotes, through: :comments
  has_many :comment_downvotes, through: :comments
end
