# Som Timer Ruby Gem:

Current Version: 0.0.3

## Overview:
Ruby Gem to access the endpoints of the Som Timer API. Source quality wellness content or use this framework for your own timer app! All methods included for this gem return a Ruby Object or a collection or Ruby Objects for ease of use. Detailed documentation for each endpoint can be found in the [`./lib/som_timer.rb` file here](https://github.com/SOM-Timer/som_timer_gem/blob/master/lib/som_timer.rb). </br>
[Published Som Timer Gem here](https://rubygems.org/gems/som-timer) </br>
[Som Timer App here](https://som-timer.herokuapp.com/) </br>
[API python/flask App here](https://som-timer-be.herokuapp.com/) </br>

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
  > SomTimer.one_timer
# get a random exercise
  > SomTimer.rand_exercise(<duration>, <category>)
# get all exercises
  > SomTimer.exercises
# update timer
  > SomTimer.update_timer(<work_interval>, <rest_interval>, <sound>)
# get all rests
  > SomTimer.rests
# create rest
  > SomTimer.create_rest(<mood_rating_1>, <mood_rating_2>, <content_selected>, <focus_interval>, <rest_interval>)
```

## Repo Usage:
Clone down and run:
```
bundle install
```

Access endpoints based on guide above ^ </br>

## Som Timer Repos:
- [Som Timer BackEnd Repo](https://github.com/SOM-Timer/som_timer_be) </br>
- [Som Timer FrontEnd Repo](https://github.com/SOM-Timer/som_timer_fe) </br>

## Author:
[Sienna Kopf](https://github.com/sienna-kopf)

## Resources Used:
[Helpful Tutorial](https://guides.rubygems.org/make-your-own-gem/)
