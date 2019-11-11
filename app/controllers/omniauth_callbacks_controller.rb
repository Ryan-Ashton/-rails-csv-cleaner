class OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  def linkedin 
    request.env["devise.mapping"] = Devise.mappings[:user]
    auth = request.env["omniauth.auth"]
    # @user = User.connect_to_linkedin(request.env["omniauth.auth"],current_user)
    @user.save
    raise
    if @user.persisted? 
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success" 
      sign_in_and_redirect @user, :event => :authentication 
    else 
      raise
      p @user.errors.messages
      # session["devise.linkedin_uid"] = request.env["omniauth.auth"] 
      redirect_to new_user_registration_url 
    end
  end
end