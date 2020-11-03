require 'spec_helper'

describe SomTimer::Exercise do
  it 'exists' do
    attrs = {
      id: 1,
      url: "https://www.youtube.com/watch?v=W5wqniA4MMc&ab_channel=EssentialSomatics",
      duration: "5",
      category: "MEDITATION"
    }

    exercise = SomTimer::Exercise.new(attrs)
    expect(exercise).to be_a SomTimer::Exercise
    expect(exercise.id).to be_a Integer
    expect(exercise.id).to eq(1)
    expect(exercise.url).to be_a String
    expect(exercise.url).to eq("https://www.youtube.com/watch?v=W5wqniA4MMc&ab_channel=EssentialSomatics")
    expect(exercise.duration).to be_a String
    expect(exercise.duration).to eq("5")
    expect(exercise.category).to be_a String
    expect(exercise.category).to eq("MEDITATION")
  end
end
