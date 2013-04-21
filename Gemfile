source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails', '3.2.13'
gem 'jquery-rails'
gem 'devise', '~> 2.2'

group :assets do
  gem 'bootstrap-sass', '~> 2.3.1'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.13'
  gem 'sqlite3'
  gem 'shoulda-matchers'
end

group :development do
  gem 'librarian-chef'
  gem 'better_errors'
end
