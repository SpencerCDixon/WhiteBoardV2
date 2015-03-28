source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'
gem 'jquery-rails'
gem 'foundation-rails'

# Devise/Omniauth/User Setup
gem 'therubyracer'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem 'dotenv-rails'

group :development do
  gem 'erb2haml'
end

group :test do
  gem 'launchy', require: false
  gem 'fuubar'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'shoulda-matchers'
  gem 'email_spec'
  gem 'valid_attribute'
end

group :production do
  gem 'rails_12factor'
end

