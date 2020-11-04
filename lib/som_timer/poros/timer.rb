class SomTimer::Timer
  attr_reader :id,
              :work_interval,
              :rest_interval,
              :sound
              
  def initialize(attributes)
    @id = attributes[:id]
    @work_interval = attributes[:work_interval]
    @rest_interval = attributes[:rest_interval]
    @sound = attributes[:sound]
  end
end
