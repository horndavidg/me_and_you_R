source 'https://rubygems.org'

# Declared a Ruby version
ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.10'
# Use postgresql as the database for Active Record

# gem 'pg'
gem 'pg', "~> 0.21"
# Rails does not support pg 1.0.0 yet

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bootstrap-sass'
gem 'bootswatch-rails'
gem 'font-awesome-sass'

# Enables all platform features on Heroku
gem 'rails_12factor'

gem 'dotenv-rails', :groups => [:development, :test]

# trying to get omniauth-facebook working
# gem 'omniauth', '~> 1.2.2'
gem 'omniauth', '~> 1.6.1'
# gem 'omniauth-facebook', '1.4.0'
gem 'omniauth-facebook', '4.0.0'

gem 'handlebars_assets'
gem 'json'

group :development do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

gem 'puma'

gem 'typhoeus'

gem 'sidekiq'

gem 'activerecord-import', '~> 0.7.0'

gem 'uploadcare-rails', '~> 1.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'capybara'
  gem 'capybara-email'
  gem 'guard-rspec', require: false
  gem 'launchy'
  gem 'puma-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda'
  gem 'shoulda-matchers'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
