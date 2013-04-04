source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'pg'
gem 'state_machine'
gem 'twitter-bootstrap-rails'
gem 'haml-rails'
gem 'simple_form'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'therubyracer'
  gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-minitest'
  gem 'spork'
end

group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem 'coveralls', require: false
end

gem 'jquery-rails'

gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
