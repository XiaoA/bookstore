source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.4'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0'

gem 'bootstrap-sass', '~>3.3.4.1'
gem 'bootstrap_form'
gem 'jquery-ui-rails', '~>5.0.5'

gem 'carrierwave-dropbox'
gem 'mini_magick'
gem 'figaro'

gem 'bcrypt', '~> 3.1.7'
gem 'will_paginate-bootstrap', '1.0.1'
gem 'stripe', '~> 1.26.0', source: 'https://code.stripe.com'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '3.3'
  gem 'spring-commands-rspec'
  gem 'guard-rspec'

  gem 'fabrication', '2.11.3'
  gem 'selenium-webdriver'
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'pry', '0.10.2'
  gem 'pry-nav', '0.2.4'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'capybara', '2.4.1'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'database_cleaner', "~> 1.4"
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
