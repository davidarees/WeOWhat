class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
    #user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash.notice = "Signed in Through Facebook!"
      sign_in_and_redirect @user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "Problem creating account"
      redirect_to root
    end
  end
end
