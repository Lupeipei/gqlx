source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.3'
gem 'pg', '1.1.4'
gem 'puma', '4.3.9'
gem 'rails-i18n', '5.1.1'
gem "cancancan", '3.0.1'
gem 'dotenv-rails', '2.7.5'
# view
gem 'sass-rails', '5.1.0'
gem 'jbuilder', '2.9.1'
gem 'webpacker', '4.0.7'
gem 'simple_form', '5.0.0'
gem 'responders', '3.0.0'
gem 'kaminari', '1.2.1'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.4.5', require: false

# model
gem 'enumerize', '2.3.1'
gem 'devise', '4.7.1'

# controller
gem 'ransack', '2.3.0'

# style
gem 'rubocop', '0.76'


group :development, :test do
  gem 'capistrano-rails','1.4.0'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'pry', '~> 0.12.2'
  gem "pry-byebug"
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'annotate'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
end

# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
