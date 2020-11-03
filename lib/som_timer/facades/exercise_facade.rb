class SomTimer::ExerciseFacade
  attr_reader :path

  def initialize(path)
    @path = path
    @service = SomTimer::Service.new(@path)
  end

  def response_exercises
    @service.exercises
  end

  # def response_update_timer(work_interval, rest_interval, sound)
  #   @service.update_timer(work_interval, rest_interval, sound)
  # end

  def exercises
    exercises_info = response_exercises[:exercises]

    exercises_info.map do |exercise|
      SomTimer::Exercise.new(exercise)
    end
  end

  # def update_timer(work_interval, rest_interval, sound)
  #   SomTimer::Timer.new(response_update_timer(work_interval, rest_interval, sound))
  # end
end
