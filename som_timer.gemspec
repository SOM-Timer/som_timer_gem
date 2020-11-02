Gem::Specification.new do |s|
  s.name        = 'som-timer'
  s.version     = '0.0.0'
  s.date        = '2020-11-01'
  s.summary     = "Som Timer API endpoint accessor"
  s.description = "A ruby library for accessing API endpoints of the SomTimer application."
  s.authors     = ["Sienna Kopf"]
  s.email       = 'princess.kopf@gmail.com'
  s.files       = ["lib/som_timer.rb", "lib/som_timer/service.rb"]
  s.homepage    =
    'https://rubygems.org/gems/som_timer'
  s.license       = 'MIT'
  s.add_dependency "faraday"
end
