class SomTimer::RestFacade
  attr_reader :path

  def initialize(path)
    @path = path
    @service = SomTimer::Service.new(@path)
  end

  def response_rests
    @service.rests
  end

  def response_create_rest(mood_rating_1, mood_rating_2, content_selected, focus_interval, rest_interval)
    @service.create_rest(mood_rating_1, mood_rating_2, content_selected, focus_interval, rest_interval)
  end

  def rests
    rests_info = response_rests[:rests]

    rests_info.map do |rest|
      SomTimer::Rest.new(rest)
    end
  end

  def create_rest(mood_rating_1, mood_rating_2, content_selected, focus_interval, rest_interval)
    SomTimer::Rest.new(response_create_rest(mood_rating_1, mood_rating_2, content_selected, focus_interval, rest_interval))
  end
end
