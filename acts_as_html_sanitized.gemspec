$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_html_sanitized/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_html_sanitized"
  s.version     = ActsAsHtmlSanitized::VERSION
  s.authors     = ["Sasha Gerrand"]
  s.email       = ["github-acts_as_html_sanitized@sgerrand.com"]
  s.homepage    = "https://github.com/sgerrand/acts_as_html_sanitized"
  s.summary     = "Sanitizes your ActiveRecord attributes."
  s.description = "Sanitizes your ActiveRecord attributes."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2"
  s.add_dependency "sanitize"

  s.add_development_dependency "sqlite3"
end
