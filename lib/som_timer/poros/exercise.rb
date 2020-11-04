class SomTimer::Exercise
  attr_reader :id,
              :url,
              :duration,
              :category

  def initialize(attributes)
    @id = attributes[:id]
    @url = attributes[:url]
    @duration = attributes[:duration]
    @category = attributes[:category].split(".")[1]
  end
end
