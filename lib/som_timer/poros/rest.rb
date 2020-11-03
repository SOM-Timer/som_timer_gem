class SomTimer::Rest
  attr_reader :id,
              :mood_rating_1,
              :mood_rating_2,
              :content_selected,
              :focus_interval,
              :rest_interval

  def initialize(attributes)
    @id = attributes[:id]
    @mood_rating_1 = attributes[:mood_rating_1]
    @mood_rating_2 = attributes[:mood_rating_2]
    @content_selected = attributes[:content_selected]
    @focus_interval = attributes[:focus_interval]
    @rest_interval = attributes[:rest_interval]
  end
end
