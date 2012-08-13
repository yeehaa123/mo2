source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.6'
gem 'jquery-rails'
gem 'haml', "~> 3.1.6"
gem 'haml-rails', "~> 0.3.4"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem "mongoid", "~> 3.0.0"
gem 'bson_ext'

gem 'devise'

# gem 'pdfkit'
gem 'wicked_pdf'
# gem 'maruku'
gem 'kramdown'
gem 'haml-kramdown'

group :development, :test do
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '0.5.5'
  # gem 'guard-cucumber'
  gem 'mongoid-rspec'
  gem 'factory_girl_rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "compass-rails", "~> 1.0.3" 
	gem 'susy'
end

group :test do
  gem 'capybara', '1.1.2'
  # gem 'cucumber-rails', '1.2.1', :require => false
  gem 'turnip'
  gem 'database_cleaner', '0.8.0'
  gem 'guard-spork', '0.3.2'  
  gem 'spork', '0.9.0'
  gem 'launchy', '2.1.0'
  gem 'email_spec'
  # Mac OS X
  gem 'rb-fsevent', '0.9.1', :require => false
  gem 'growl', '1.0.3'
  # Linux
  # gem 'rb-inotify', '0.8.8'
  # gem 'libnotify', '0.5.9'
end

group :production do
  gem "wkhtmltopdf-heroku", :git => 'git://github.com/camdez/wkhtmltopdf-heroku.git'
  gem 'thin'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

gem 'passenger'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'