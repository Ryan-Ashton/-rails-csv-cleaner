Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_APP_ID'], ENV['LINKEDIN_APP_SECRET'], secure_image_url: true, callback_path: '/auth/:provider/callback'#
end