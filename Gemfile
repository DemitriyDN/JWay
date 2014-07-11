source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '~> 4.1.4'
gem 'pg'

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'

gem 'devise'
gem 'redactor-rails'
gem 'kaminari'
gem 'acts-as-taggable-on'

group :doc do
  gem 'sdoc', '~> 0.4.0'
end

group :development do
  gem 'spring'

  gem 'better_errors'
  gem 'binding_of_caller'

  # Not working ?
  # gem 'pry-rails'
  # gem 'hirb'

  # => rails panel
  gem 'meta_request'

  # => brakeman -o public/safeguard/brakeman
  gem 'brakeman', require: false
end

group :test, :development do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'capybara'
end

group :test do
  # => COVERAGE=true rspec spec/
  gem 'simplecov'

  gem 'database_cleaner'
  gem 'factory_girl_rails'

  gem 'faker'

  gem 'launchy'
  gem 'poltergeist'
  gem 'capybara-screenshot'

  gem 'email_spec'
  gem 'capybara-email'
end
