class CallbacksController <  Devise::OmniauthCallbacksController
  def spotify
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect root_url
  end
end