class SomTimer::Service
  def initialize(path)
    @path = path
  end

  def timer
    to_json("#{@path}")
  end

  def exercises
    to_json("#{@path}")
  end

  def rand_exercise(duration, category)
    to_json("#{@path}?duration=#{duration}&category=#{category}")
  end

  def update_timer(work_interval, rest_interval, sound)
    to_json_post(work_interval, rest_interval, sound)
  end

  private

  def conn
    Faraday.new("https://som-timer-be.herokuapp.com/api/")
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def to_json_post(work_interval, rest_interval, sound)
    response = conn.put do |req|
      req.url "https://som-timer-be.herokuapp.com/api/#{@path}"
      req.headers['Content-Type'] = 'application/json'
      req.body = { "work_interval": "#{work_interval}", "rest_interval": "#{rest_interval}", "sound": "#{sound}" }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
