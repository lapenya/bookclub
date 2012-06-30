source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#gem 'mysql2', '~> 0.3.11'
gem 'pg'
#gem 'psych'
gem 'haml'

# Authentication
gem 'devise'
gem 'omniauth-facebook'
gem 'aws-s3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'bootstrap-sass', '~> 2.0.3'
  gem "twitter-bootstrap-rails"
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
#gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

group :development do
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'

  # Installed  when converting ERB to HAMLto SLIM
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'mail_view', :git => 'https://github.com/37signals/mail_view.git'

end

group :test do
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'

  # Pretty printed test output
  gem 'turn', :require => false
end

group :production do
  gem 'thin'
end
