require 'spec_helper'

describe SomTimer::Timer do
  it 'exists' do
    attrs = {
      id: 1,
      work_interval: "25",
      rest_interval: "5",
      sound: "chordCliff"
    }

    timer = SomTimer::Timer.new(attrs)
    expect(timer).to be_a SomTimer::Timer
    expect(timer.id).to be_a Integer
    expect(timer.id).to eq(1)
    expect(timer.work_interval).to be_a String
    expect(timer.work_interval).to eq("25")
    expect(timer.rest_interval).to be_a String
    expect(timer.rest_interval).to eq("5")
    expect(timer.sound).to be_a String
    expect(timer.sound).to eq("chordCliff")
  end
end
