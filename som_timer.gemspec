Gem::Specification.new do |s|
  s.name        = 'som-timer'
  s.version     = '0.0.3'
  s.date        = '2020-11-01'
  s.summary     = "Som Timer API endpoint accessor"
  s.description = "A ruby library for accessing API endpoints of the SomTimer application."
  s.authors     = ["Sienna Kopf"]
  s.email       = 'princess.kopf@gmail.com'
  s.files       = ["lib/som_timer.rb",
                   "lib/som_timer/service.rb",
                   "lib/som_timer/poros/exercise.rb",
                   "lib/som_timer/poros/rest.rb",
                   "lib/som_timer/poros/timer.rb",
                   "lib/som_timer/facades/exercise_facade.rb",
                   "lib/som_timer/facades/rest_facade.rb",
                   "lib/som_timer/facades/timer_facade.rb"]
  s.homepage    =
    'https://rubygems.org/gems/som_timer'
  s.license       = 'MIT'
  s.add_dependency "faraday"
  s.add_dependency "rdoc"
  s.add_development_dependency "mocha"
end
