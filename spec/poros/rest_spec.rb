require 'spec_helper'

describe SomTimer::Rest do
  it 'exists' do
    attrs = {
      id: 1,
      mood_rating_1: 3,
      mood_rating_2: 4,
      content_selected: "MOVEMENT",
      focus_interval: "25:00",
      rest_interval: "5:00"
    }

    rest = SomTimer::Rest.new(attrs)
    expect(rest).to be_a SomTimer::Rest
    expect(rest.id).to be_a Integer
    expect(rest.id).to eq(1)
    expect(rest.mood_rating_1).to be_a Integer
    expect(rest.mood_rating_1).to eq(3)
    expect(rest.mood_rating_2).to be_a Integer
    expect(rest.mood_rating_2).to eq(4)
    expect(rest.content_selected).to be_a String
    expect(rest.content_selected).to eq("MOVEMENT")
    expect(rest.focus_interval).to be_a String
    expect(rest.focus_interval).to eq("25:00")
    expect(rest.rest_interval).to be_a String
    expect(rest.rest_interval).to eq("5:00")
  end
end
