source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '4.2.0'
gem 'pg'

# Assets
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 5.0'
gem 'haml-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'foundation-rails', '5.5.1.0'
gem 'font-awesome-sass', '~> 4.3.0'

# Devise/Omniauth/User Setup
gem 'therubyracer'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'

group :development do
  gem 'spring'
  gem 'dotenv-rails'
  gem 'mailcatcher'
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

