# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'max_exchange_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'max_exchange_api'
  spec.version       = MaxExchangeApi::VERSION
  spec.authors       = ['khiav reoy']
  spec.email         = ['mrtmrt15xn@yahoo.com.tw']

  spec.summary       = 'MAX Exchange API Ruby SDK'
  spec.description   = 'MAX Exchange API Ruby SDK'
  spec.homepage      = 'https://github.com/khiav223577/max_exchange_api'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject{|f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}){|f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata      = {
    'homepage_uri'      => 'https://github.com/khiav223577/max_exchange_api',
    'changelog_uri'     => 'https://github.com/khiav223577/max_exchange_api/blob/master/CHANGELOG.md',
    'source_code_uri'   => 'https://github.com/khiav223577/max_exchange_api',
    'documentation_uri' => 'https://www.rubydoc.info/gems/max_exchange_api',
    'bug_tracker_uri'   => 'https://github.com/khiav223577/max_exchange_api/issues',
  }

  spec.add_development_dependency 'bundler', '>= 1.17', '< 3.x'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'minitest', '~> 5.0'

  spec.add_dependency 'httparty', '>= 0.18.1'
end
