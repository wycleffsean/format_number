# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'format_number'

Gem::Specification.new do |spec|
  spec.name          = "format_number"
  spec.version       = FormatNumber::VERSION
  spec.authors       = ["Sean Carey"]
  spec.email         = ["sean.carey@technekes.com"]

  spec.summary       = %q{format numbers}
  spec.description   = %q{format numbers}
  spec.homepage      = "https://github.com/wycleffsean/format_number"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'actionview', '~> 5.0', '>= 5.0.2'
  spec.add_development_dependency 'activerecord', '~> 5.0', '>= 5.0.2'
  spec.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.13'
  spec.add_development_dependency 'pry'
end
