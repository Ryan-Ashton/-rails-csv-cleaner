Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_APP_ID'], ENV['LINKEDIN_APP_SECRET'], {provider_ignores_state: true}
end