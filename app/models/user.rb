class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
		 :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :votes, through: :posts
  has_many :votes, through: :comments

  def self.from_omniauth(auth)
  	where(provider: auth.uid, uid: auth[:uid]).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.username = auth.info.nickname
  		user.email = auth.info.email
  		user.save
  	end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"], without_protection: true) do |user|
  			user.attributes = params
  			user.valid?
  		end
  	else
  		super
  	end
  end
end
