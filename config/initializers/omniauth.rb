Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_APP_ID'], ENV['LINKEDIN_APP_SECRET'], secure_image_url: true, scope: 'r_liteprofile', callback_path: '/auth/:provider/callback', fields: ['id', 'first-name', 'last-name']
end