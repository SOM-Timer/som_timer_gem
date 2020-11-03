class SomTimer::TimerFacade
  attr_reader :path

  def initialize(path)
    @path = path
    @service = SomTimer::Service.new(@path)
  end

  def response_timer
    @service.timer
  end

  def response_update_timer(work_interval, rest_interval, sound)
    @service.update_timer(work_interval, rest_interval, sound)
  end

  def one_timer
    SomTimer::Timer.new(response_timer)
  end

  def update_timer(work_interval, rest_interval, sound)
    SomTimer::Timer.new(response_update_timer(work_interval, rest_interval, sound))
  end
end
