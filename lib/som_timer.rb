require "faraday"
require "pry"
require "json"

class SomTimer
  def self.hello_world
    puts "Hello World! This is SomTimer, a timer that cares.
            \nBased on the pomodoro technique™️, this application provides users with curated wellness content during break intervals.
            \nBuild in rest, so you can focus best."
  end

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
    service = Service.new(path)
    service.rests
  end

  def self.create_rest(mood_rating_1, mood_rating_2, content_selected, focus_interval, rest_interval, path = "rests")
    service = Service.new(path)
    service.create_rest(mood_rating_1, mood_rating_2, content_selected, focus_interval, rest_interval)
  end
end

require 'som_timer/service'
require 'som_timer/facades/timer_facade'
require 'som_timer/facades/exercise_facade'
