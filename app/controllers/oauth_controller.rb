require 'pry-byebug'

class OauthController < ApplicationController
  skip_before_action :authenticate_user!

  def callback
    begin
      oauth = OauthService.new(request.env['omniauth.auth'])
      p request.env
      byebug
      if oauth_account = oauth.create_oauth_account!
        # redirect_to Config.provider_login_path
        redirect_to dashboard_path
      end
    rescue StandardError => e
      raise
      flash[:alert] = "There was an error while trying to authenticate your account."
      p e
      redirect_to dashboard_path

      # redirect_to register_path
    end
  end

  def failure
    flash[:alert] = "There was an error while trying to authenticate your account."
    redirect_to register_path
  end
end
