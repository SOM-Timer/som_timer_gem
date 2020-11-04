class SomTimer::ExerciseFacade
  attr_reader :path

  def initialize(path)
    @path = path
    @service = SomTimer::Service.new(@path)
  end

  def response_exercises
    @service.exercises
  end

  def response_rand_exercise(duration, category)
    @service.rand_exercise(duration, category)
  end

  def exercises
    exercises_info = response_exercises[:exercises]

    exercises_info.map do |exercise|
      SomTimer::Exercise.new(exercise)
    end
  end

  def rand_exercise(duration, category)
    SomTimer::Exercise.new(response_rand_exercise(duration, category))
  end
end
