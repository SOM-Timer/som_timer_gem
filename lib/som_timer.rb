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
end
