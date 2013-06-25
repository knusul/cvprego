source 'https://rubygems.org'

gem "rails", "4.0.0.rc1"
gem 'jquery-rails', "2.2.1"
gem "mysql2"
gem 'carrierwave'
gem "therubyracer"
gem 'inherited_resources', git: "git://github.com/josevalim/inherited_resources.git"
gem 'has_scope', git: "git://github.com/plataformatec/has_scope.git"
gem 'devise', git: "git://github.com/plataformatec/devise.git", branch: "rails4"
gem 'simple_form', git: "git://github.com/plataformatec/simple_form.git"

gem 'pdfkit'
gem 'rmagick'

gem 'sass-rails',   git: "git://github.com/rails/sass-rails.git"
gem 'coffee-rails', git: "git://github.com/rails/coffee-rails.git"
gem 'uglifier', '>= 1.0.3'

gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem "ember-rails", :git => "https://github.com/emberjs/ember-rails.git"



gem 'active_model_serializers', github: 'rails-api/active_model_serializers'

group :development do
  gem 'quiet_assets', '~> 1.0.1'
  gem "letter_opener"
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano'
end


group :test, :development do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
  gem "better_errors"
  gem 'poltergeist'
  gem 'guard-jasmine'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem "jasminerice", :git => 'https://github.com/bradphelan/jasminerice.git'
end

group :test do
  gem 'sqlite3'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'phantomjs'
  gem 'capybara-webkit', :git => 'git@github.com:thoughtbot/capybara-webkit.git'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
end
