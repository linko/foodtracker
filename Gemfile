source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'pg'
gem 'thin'
gem 'haml-rails'
gem 'jquery-rails'
gem 'devise'
gem 'inherited_resources'
gem 'has_scope'
gem 'simple_form'
gem 'heroku'
gem 'rack-cors', :require => 'rack/cors'
gem 'uuid'
gem 'fuubar'
gem 'letter_opener'
gem 'airbrake'


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 3.3.1'
  gem 'execjs'
  gem 'therubyracer'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'rspec-rails'
  gem 'rspec-instafail'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'shoulda'
  gem 'spin'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spin'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'libnotify'
  gem 'launchy', :require => false
end


group :test, :development do
  gem 'ffaker'
end

group :production do
  gem 'unicorn'
end


group :tools do
  gem 'capistrano', '~> 2.0'
  gem 'capistrano_colors'
  gem 'sushi'
  gem 'recap', '~> 1.2'
  gem 'capistrano-unicorn', require: false
  gem 'bundler-audit'
  gem 'capistrano-colorized-stream'
end
