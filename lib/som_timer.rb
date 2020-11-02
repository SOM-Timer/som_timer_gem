require "faraday"
require "pry"
require 'json'

class SomTimer
  def self.perform_request(path)
    url = "https://som-timer-be.herokuapp.com/api/#{path}"
    response = Faraday.get(url)
    hash = JSON.parse(response.body, symbolize_names: true)
    puts hash
  end

  def self.update_timer(work_interval, rest_interval, sound)
    conn = Faraday.new
    response = conn.put do |req|
      req.url "https://som-timer-be.herokuapp.com/api/timers/1"
      req.headers['Content-Type'] = 'application/json'
      req.body = { "work_interval": "#{work_interval}", "rest_interval": "#{rest_interval}", "sound": "#{sound}" }.to_json
    end
    hash = JSON.parse(response.body, symbolize_names: true)
    puts hash
  end

  def self.one_timer
    self.perform_request("timers/1")
  end

  def self.rand_exercise(duration, category)
    url = "rand_exercise?duration=#{duration}&category=#{category}"
    self.perform_request(url)
  end
end
