class SomTimer::TimerFacade
  attr_reader :path

  def initialize(path)
    @path = path
    @service = SomTimer::Service.new(@path)
  end

  def response_timer
    @service.timer
  end

  def one_timer
    SomTimer::Timer.new(response_timer)
  end
end
