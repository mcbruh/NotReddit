class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
		 :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :votes, through: :posts
  has_many :votes, through: :comments
end
