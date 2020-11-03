class SomTimer::RestFacade
  attr_reader :path

  def initialize(path)
    @path = path
    @service = SomTimer::Service.new(@path)
  end

  def response_rests
    @service.rests
  end
  #
  # def response_update_timer(work_interval, rest_interval, sound)
  #   @service.update_timer(work_interval, rest_interval, sound)
  # end

  def rests
    rests_info = response_rests[:rests]

    rests_info.map do |rest|
      SomTimer::Rest.new(rest)
    end
  end

  # def update_timer(work_interval, rest_interval, sound)
  #   SomTimer::Timer.new(response_update_timer(work_interval, rest_interval, sound))
  # end
end
