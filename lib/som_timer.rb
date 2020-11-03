require "faraday"
require "pry"
require "json"

gem 'rdoc'
require 'rdoc/rdoc'

options = RDoc::Options.new
# see RDoc::Options

rdoc = RDoc::RDoc.new
rdoc.document options
# see RDoc::RDoc

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

  def self.one_timer(path = "timers/1")
    TimerFacade.new(path).one_timer
  end

  def self.rand_exercise(duration, category, path = "rand_exercise")
    ExerciseFacade.new(path).rand_exercise(duration, category)
  end

  def self.exercises(path = "exercises")
    ExerciseFacade.new(path).exercises
  end

  def self.rests(path = "rests")
    RestFacade.new(path).rests
  end

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
