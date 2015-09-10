OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 903509093070590, ENV['FACEBOOK_SECRET'],
  :info_fields => 'email,name,image'
end

# Additional options for the OmniAuth object:
# => :scope => 'public_profile,email', :info_fields => 'email,name'