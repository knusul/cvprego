source 'https://rubygems.org'

gem 'pg'
gem 'unicorn'
gem "rails", "4.0.1"
gem 'jquery-rails', "2.2.1"
gem "jquery-fileupload-rails"
gem 'carrierwave'
gem "therubyracer"
gem 'inherited_resources', git: "git://github.com/josevalim/inherited_resources.git"
gem 'has_scope', git: "git://github.com/plataformatec/has_scope.git"
gem 'devise', git: "git://github.com/plataformatec/devise.git"
gem 'simple_form', git: "git://github.com/plataformatec/simple_form.git"
gem 'airbrake'
gem 'geocoder'

gem 'prawn'
gem 'haml'
gem 'rmagick'

gem 'sass-rails',   git: "git://github.com/rails/sass-rails.git"
gem "rails_config"
gem 'coffee-rails', git: "git://github.com/rails/coffee-rails.git"
gem 'uglifier', '>= 1.0.3'

gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails", :git => "https://github.com/seyhunak/twitter-bootstrap-rails", :branch => 'bootstrap3'
gem "ember-rails", :git => "https://github.com/emberjs/ember-rails.git"

gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'



gem 'active_model_serializers', "0.8.1"

group :development do
  gem 'quiet_assets', '~> 1.0.1'
  gem "letter_opener"
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano-unicorn', :require => false
  gem 'capistrano-nginx-unicorn', require: false, group: :development
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
  gem 'database_cleaner'
  gem 'capybara'
  gem 'phantomjs'
  gem 'capybara-webkit', :git => 'git@github.com:thoughtbot/capybara-webkit.git'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
end
