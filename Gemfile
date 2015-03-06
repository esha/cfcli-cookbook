source 'https://rubygems.org'

gem 'berkshelf',  '~> 3.2.1'
gem 'chefspec',   '~> 4.0'
gem 'foodcritic', '~> 4.0'
gem 'rake',       '~> 10.4'
gem 'rubocop',    '~> 0.28'

group :development do
  gem 'guard',         '~> 2.11'
  gem 'guard-rspec',   '~> 4.5'
  gem 'guard-rubocop', '~> 1.2'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'coveralls',                 require: false
  gem 'simplecov',                 require: false
end

group :integration do
  gem 'test-kitchen',    '~> 1.2.1'
  gem 'kitchen-vagrant', '~> 0.15'
end
