source 'https://rubygems.org'

gem "rails", "4.0.0.rc1"
gem 'pdfkit'
gem 'carrierwave'
gem 'rmagick'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'devise', git: "git://github.com/plataformatec/devise.git", branch: "rails4"
gem 'simple_form', git: "git://github.com/plataformatec/simple_form.git"
group :development do
  gem "letter_opener"
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano'
end
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   git: "git://github.com/rails/sass-rails.git"
  gem 'coffee-rails', git: "git://github.com/rails/coffee-rails.git"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'pry'
gem 'pry-rails'
gem 'pry-nav'
gem 'pry-remote'

gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem 'handlebars-source', '1.0.0.rc4'
gem "ember-rails", :git => "https://github.com/emberjs/ember-rails.git"
group :development, :test do
  gem "better_errors"
  gem 'poltergeist'
  gem 'guard-jasmine'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'rb-inotify'
  gem "jasminerice", :git => 'https://github.com/bradphelan/jasminerice.git'
end

group :development, :production do
  gem "mysql2"
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'phantomjs'
  gem 'capybara-webkit', :git => 'git@github.com:thoughtbot/capybara-webkit.git'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
