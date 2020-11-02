# Som Timer Ruby Gem:

## Overview: 
Ruby Gem to access the endpoints of the [Som Timer](https://som-timer.herokuapp.com/) API. 

## Gem Installation : 
To install: 
```
$ gem install som-timer
```

To jump into interactive ruby session and access endpoints:
```
$ irb 
> require 'som_timer'
# get one timer 
> SomTimer.one_timer("timers/1")
# get a random exercise 
> SomTimer.rand_exercise(<duration>, <category>)
# get all exercises 
> SomTimer.exercises
# update timer
> SomTimer.update_timer(<work_interval>, <rest_interval>, <sound>)
```

## Repo Usage:
Clone down and run: 
```
bundle install 
```

To update/build gem run: 
```
$ gem build som_timer.gemspec
$ gem install ./som-timer-0.0.0.gem
```

Access endpoints like above ^ </br>

## Som Timer API Endpoint Documentation
- Published [Here](https://www.postman.com/collections/b46b141361f71503a2dc)
- [Deployed Application](https://som-timer-be.herokuapp.com/)
- [Som Timer BackEnd Repo](https://github.com/SOM-Timer/som_timer_be)

## Author:
[Sienna Kopf](https://github.com/sienna-kopf)

## Resources:
[Helpful Tutorial](https://guides.rubygems.org/make-your-own-gem/)
