require 'pp'
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify
    @user = User.from_omniauth(request.env["omniauth.auth"])
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @user.credential_data = spotify_user.to_hash
    @user.save!
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => 'Spotify') if is_navigational_format?
    else
      session['devise.spotify_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
  def failure
    redirect_to root_path
  end
end