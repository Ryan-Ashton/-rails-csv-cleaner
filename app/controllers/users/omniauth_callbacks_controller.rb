class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    auth = request.env["omniauth.auth"]
    @user = User.connect_to_linkedin(request.env["omniauth.auth"],current_user)
    if @user.persisted?
     flash[:notice] = "Successfully logged in with Linkedin"
     sign_in_and_redirect @user, :event => :authentication
   else
     session["devise.linkedin_uid"] = request.env["omniauth.auth"]
     redirect_to new_user_registration_url
   end
 end
 end