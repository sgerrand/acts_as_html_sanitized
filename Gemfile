source "https://rubygems.org"

gemspec

platforms :rbx do
  gem 'rubysl', '~> 2.0'
  gem 'rubinius-developer_tools'
end

group :development do
  gem 'rake'
  gem 'activerecord-jdbcsqlite3-adapter', :platforms => :jruby
  gem 'sqlite3', :platforms => :ruby
end

group :development, :test do
  gem 'minitest'
end
