Gem::Specification.new do |s|
  s.name        = 'correos_chile'
  s.version     = '0.0.1'
  s.date        = '2017-07-10'
  s.summary     = 'retreive tracking info'
  s.description = 'This gem will give some tracking information'
  s.authors     = ['Zetahawke']
  s.email       = 'michel.szinavel@gmail.com'
  s.files       = ['lib/correos_chile.rb', 'lib/correos_chile/order.rb']
  s.homepage    =
    'http://rubygems.org/gems/correos_chile'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.2'

  s.add_dependency 'nokogiri', '~> 1.6'
  s.add_dependency 'httparty'

  s.add_development_dependency 'bundler', '~> 1.9'
  s.add_development_dependency 'rake', '~> 10.0'
end
