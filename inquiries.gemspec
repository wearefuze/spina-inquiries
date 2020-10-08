$:.push File.expand_path("../lib", __FILE__)

require "spina/inquiries/version"

Gem::Specification.new do |s|
  s.name = "spina-inquiries"
  s.version = Spina::Inquiries::VERSION
  s.authors = ["Dan Mitchell"]
  s.email = ["dan@danmitchell.co.uk"]
  s.homepage = "https://www.danmitchell.co.uk/"
  s.summary = "Inquiry system for Spina"
  s.description = "Plugin for Spina CMS to include inquiries on your website"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'invisible_captcha', '~> 1.1'
  s.add_runtime_dependency 'spina', '>= 1.0.0'
end
