$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spina/clients/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spina-clients"
  s.version     = Spina::Clients::VERSION
  s.authors     = ["Digital Reflow"]
  s.email       = ["info@digitalreflow.co.uk"]
  s.homepage    = "http://www.digitalreflow.co.uk"
  s.summary     = "Client signup system for Spina"
  s.description = "Plugin for Spina CMS to include client signups on your website"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "sqlite3"

end
