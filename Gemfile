source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

source "https://rails-assets.org"

gem 'rails-assets-bootstrap', ">= 4.0.0.alpha.2"
gem 'rails-assets-tether'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'dotenv-rails', '~> 2.6'

# API
gem 'jsonapi-resources'
gem 'jwt', '~> 2.1'
gem 'fast_jsonapi', git: "https://github.com/Netflix/fast_jsonapi", branch: "dev"

# Backend
gem 'bootsnap', '>= 1.4.2', require: false
gem 'sprockets-rails', '2.3.3'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'autoprefixer-rails'
gem 'inherited_resources'

# form
gem 'simple_form'
gem 'translate_enum', require: 'translate_enum/active_record'

# style guide
gem 'rubocop-airbnb'

# Authentication and security
gem 'devise'
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development, :test do
  gem 'better_errors', '~> 2.5'
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'faker', '~> 1.9'
  gem 'pry-byebug', '~> 3.7'
  gem 'pry-rails', '~> 0.3'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
