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
    if self.where(email: auth.info.email).exists?
      return_user = self.where(email: auth.info.email).first
      return_user.provider = auth.provider
      return_user.uid = auth.uid
    else
      return_user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.username
        user.email = auth.info.email
        user.oauth_token = auth.credentials.token
        user.oauth_verifier = auth.credentials.verifier
      end
    end
    return_user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.twitter_data"]
        user.username = data["nickname"]
        user.email = data["email"]
        user.uid = data[:uid]
      end
    end
  end

  def password_required?
  	super && provider.blank?
  end

end
