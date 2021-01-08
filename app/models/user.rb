class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:spotify]

  has_one_attached :avatar
  has_many :routes
  
  # overwriting new_with_session function
  def self.new_with_session(params, session)
    # call super(the overwritten function), it will return a resource and in this case you are
    # naming it 'user' in the block
    super.tap do |user|
      # if extra information was provided by spotify when user logged in, assign whatever comes in
      # session["devise.spotify_data"]["extra"]["raw_info"] to 'data' variable
      if data = session['devise.spotify_data'] && session['devise.spotify_data']['extra']['raw_info']
        # assign 'email' given by spotify in case the 'user' object doesn't have one yet
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.avatar = auth.images.first.url
    end
  end
end