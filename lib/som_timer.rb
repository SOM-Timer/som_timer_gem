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
    service = Service.new(path)
    service.update_timer(work_interval, rest_interval, sound)
  end

  def self.one_timer(path = "timers/1")
    service = Service.new(path)
    service.timer
  end

  def self.rand_exercise(duration, category, path = "rand_exercise")
    service = Service.new(path)
    service.rand_exercise(duration, category)
  end

  def self.exercises(path = "exercises")
    service = Service.new(path)
    service.exercises
  end
end

require 'som_timer/service'
