require "faraday"
require "pry"
require "json"

gem 'rdoc'
require 'rdoc/rdoc'

class SomTimer
  ##
  # Learn more about Som Timer
  #
  # Example:
  #   >> SomTimer.hello_world
  #   Hello World! This is SomTimer, a timer that cares.
  #
  #   Based on the pomodoro technique™️, this application provides users with curated wellness content during break intervals.
  #
  #   Build in rest, so you can focus best.

  def self.hello_world
    puts "Hello World! This is SomTimer, a timer that cares.
            \nBased on the pomodoro technique™️, this application provides users with curated wellness content during break intervals.
            \nBuild in rest, so you can focus best."
  end

  ##
  # Update Timer 1
  #
  # Example:
  #   >> SomTimer.update_timer("45:00", "10:00", "chordCliff")
  #   => #<SomTimer::Timer:0x00007fc9481db9d8 @id=1, @work_interval="45:00", @rest_interval="10:00", @sound="chordCliff">
  #   Accessing Attributes:
  #     >> timer = SomTimer.update_timer("45:00", "10:00", "chordCliff")
  #     => #<SomTimer::Timer:0x00007fc9481db9d8 @id=1, @work_interval="45:00", @rest_interval="10:00", @sound="chordCliff">
  #     >> timer.id
  #     => 1
  #     >> timer.work_interval
  #     => "45:00"
  #     >> timer.rest_interval
  #     => "10:00"
  #     >> timer.sound
  #     => "chordCliff"
  #
  # Arguments:
  #   work_interval: Time in minutes (string)
  #   rest: Time in minutes valid options: "5", "7", "10" (string)
  #   sound: Sound name valid options: "balineseGong", "birdChord", "goodOldSynths", "levelUp", "pianoDreams", "reverbSplash" (string)

  def self.update_timer(work_interval, rest_interval, sound, path = "timers/1")
    TimerFacade.new(path).update_timer(work_interval, rest_interval, sound)
  end

  ## GET Timer 1
  #
  # Example:
  #   >> SomTimer.one_timer
  #   => #<SomTimer::Timer:0x00007fbe38903c08 @id=1, @work_interval="45:00", @rest_interval="5", @sound="reverbSplash">
  #   Accessing Attributes:
  #     >> timer = SomTimer.one_timer
  #     => #<SomTimer::Timer:0x00007fbe38903c08 @id=1, @work_interval="45:00", @rest_interval="5", @sound="reverbSplash">
  #     >> timer.id
  #     => 1
  #     >> timer.work_interval
  #     => "45:00"
  #     >> timer.rest_interval
  #     => "5"
  #     >> timer.sound
  #     => "reverbSplash"

  def self.one_timer(path = "timers/1")
    TimerFacade.new(path).one_timer
  end

  ##
  # GET Random Exercise
  #
  # Example:
  #   >> SomTimer.rand_exercise("10:00", "MOVEMENT")
  #   => #<SomTimer::Exercise:0x00007fbe370fd820 @id=16, @url="https://www.youtube.com/watch?v=KJaWIBg15n0&ab_channel=ExtremeFitnessPro", @duration="10:00", @category="MOVEMENT">
  #   Accessing Attributes:
  #     >> random_exercise = SomTimer.rand_exercise("10:00", "MOVEMENT")
  #     => #<SomTimer::Exercise:0x00007fbe370fd820 @id=16, @url="https://www.youtube.com/watch?v=KJaWIBg15n0&ab_channel=ExtremeFitnessPro", @duration="10:00", @category="MOVEMENT">
  #     >> random_exercise.id
  #     => 16
  #     >> random_exercise.url
  #     => "https://www.youtube.com/watch?v=KJaWIBg15n0&ab_channel=ExtremeFitnessPro"
  #     >> random_exercise.duration
  #     => "10:00"
  #     >> random_exercise.category
  #     => "MOVEMENT"
  #
  # Arguments:
  #   duration: Time in minutes (string)
  #   category: Somatic Category of choice. Valid options: "MOVEMENT", "MEDITATION", "Somatic" (string)

  def self.rand_exercise(duration, category, path = "rand_exercise")
    ExerciseFacade.new(path).rand_exercise(duration, category)
  end

  ## GET all Exercises
  #
  # Example:
  #   >> SomTimer.exercises
  #   => [...] (array of all exercises)
  #   Accessing Attributes:
  #     >> exercises = SomTimer.exercises
  #     => [...] (array of all exercises)
  #     >> excersises.count
  #     => 33
  #     >> exercise_1 = exercises[0]
  #     => #<SomTimer::Exercise:0x00007fbe37a1f390 @id=1, @url="https://www.youtube.com/watch?v=W5wqniA4MMc&ab_channel=EssentialSomatics", @duration="10:00", @category="MEDITATION">
  #     >> exercise_1.id
  #     => 1
  #     >> exercise_1.url
  #     => "https://www.youtube.com/watch?v=W5wqniA4MMc&ab_channel=EssentialSomatics"
  #     >> exercise_1.duration
  #     => "10:00"
  #     >> exercise_1.category
  #     => "MEDITATION"

  def self.exercises(path = "exercises")
    ExerciseFacade.new(path).exercises
  end

  ## GET all Rests
  #
  # Example:
  #   >> SomTimer.rests
  #   => [...] (array of all rests)
  #   Accessing Attributes:
  #     >> rests = SomTimer.rests
  #     => [...] (array of all rests)
  #     >> rests.count
  #     => 19
  #     >> rest_1 = rests[0]
  #     => #<SomTimer::Rest:0x00007fbe391b5770 @id=1, @mood_rating_1=3, @mood_rating_2=5, @content_selected="MOVEMENT", @focus_interval="25", @rest_interval="5">
  #     >> rest_1.id
  #     => 1
  #     >> rest_1.mood_rating_1
  #     => 3
  #     >> rest_1.mood_rating_2
  #     => 5
  #     >> rest_1.category_selected
  #     => "MOVEMENT"
  #     >> rest_1.focus_interval
  #     => "25"
  #     >> rest_1.rest_interval
  #     => "5"

  def self.rests(path = "rests")
    RestFacade.new(path).rests
  end

  ##
  # Create Rest
  #
  # Example:
  #   >> SomTimer.create_rest(3, 4, "MEDITATION", "25:00", "5")
  #   =>
  #   Accessing Attributes:
  #     >> rest = SomTimer.SomTimer.create_rest(3, 4, "MEDITATION", "25:00", "5")
  #     =>
  #     >> rest.id
  #     => 1
  #     >> rest.mood_rating_1
  #     => 3
  #     >> rest.mood_rating_2
  #     => 4
  #     >> rest.category_selected
  #     => "MEDITATION"
  #     >> rest.focus_interval
  #     => "25:00"
  #     >> rest.rest_interval
  #     => "5"
  #
  # Arguments:
  #   mood_rating_1: mood before rest interval on a scale from 1-5 (integer)
  #   mood_rating_2: mood after rest interval on a scale from 1-5 (integer)
  #   category_selected: Somatic Category chosen during rest interval. Valid options: "MOVEMENT", "MEDITATION", "Somatic" (string)
  #   focus_interval: Time in minutes of focus time (string)
  #   rest_interval: Time in minutes for rest time valid options: "5", "7", "10" (string)

  def self.create_rest(mood_rating_1, mood_rating_2, content_selected, focus_interval, rest_interval, path = "rests")
    RestFacade.new(path).create_rest(mood_rating_1, mood_rating_2, content_selected, focus_interval, rest_interval)
  end
end

require 'som_timer/service'
require 'som_timer/poros/timer'
require 'som_timer/poros/exercise'
require 'som_timer/poros/rest'
require 'som_timer/facades/timer_facade'
require 'som_timer/facades/exercise_facade'
require 'som_timer/facades/rest_facade'
