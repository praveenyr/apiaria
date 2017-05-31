Gem::Specification.new do |s|
   s.name          = 'apiaria'
   s.version       = '0.0.1'
   s.date          = '2017-31-05'
   s.summary       = 'Apiaria API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Praveen Yallakara']
   s.email         = 'praveenyr@gmail.com'
   s.files         = ['lib/apiaria.rb']
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/apiaria'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
 end
