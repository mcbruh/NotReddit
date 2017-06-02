class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:twitter]
  has_many :posts
  has_many :comments
  has_many :votes, through: :posts
  has_many :votes, through: :comments
  validates :email, presence: true, uniqueness:true
  validates :username, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user| 
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.twitter_data"] && session["devise.twitter_data"].except("extra")
        user.username = data["nickname"] if user.username.blank?
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def password_required?
  	super && provider.blank?
  end

end
