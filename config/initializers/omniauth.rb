OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use Rack::Session::Cookie, :secret => 'abc123'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 903509093070590, ENV['FACEBOOK_SECRET'],
  :scope => 'email', :info_fields => 'name,email'
end

# Additional options for the OmniAuth object:
# => :scope => 'public_profile,email', :info_fields => 'email,name'