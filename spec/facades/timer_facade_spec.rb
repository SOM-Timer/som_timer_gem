require 'spec_helper'

RSpec.describe SomTimer::TimerFacade do
  describe 'instance methods' do
    describe 'GET timer (1)' do
      before :each do
        path = "timers/1"
        @facade = SomTimer::TimerFacade.new(path)
      end
      describe '#response_timer' do
        it "calls the SomTimer API to get timer (1)", :vcr do
          response = @facade.response_timer

          expect(response).to be_a Hash
          expect(response).to have_key :id
          expect(response).to have_key :work_interval
          expect(response).to have_key :rest_interval
          expect(response).to have_key :sound
          expect(response[:id]).to eq(1)
          expect(response[:work_interval]).to eq("25")
          expect(response[:rest_interval]).to eq("5")
          expect(response[:sound]).to eq("reverbSplash")
        end
      end

      describe '#one_timer' do
        it "instantiates a timer oject from the JSON response of get Timer", :vcr do
          timer = @facade.one_timer

          expect(timer).to be_a SomTimer::Timer
          expect(timer.id).to be_a Integer
          expect(timer.id).to eq(1)
          expect(timer.work_interval).to be_a String
          expect(timer.work_interval).to eq("25")
          expect(timer.rest_interval).to be_a String
          expect(timer.rest_interval).to eq("5")
          expect(timer.sound).to be_a String
          expect(timer.sound).to eq("reverbSplash")
        end
      end
    end
  end
end
