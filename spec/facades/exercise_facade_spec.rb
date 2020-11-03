require 'spec_helper'

RSpec.describe SomTimer::ExerciseFacade do
  describe 'instance methods' do
    describe 'GET exercises (all)' do
      before :each do
        path = "exercises"
        @facade = SomTimer::ExerciseFacade.new(path)
      end
      describe '#response_exercises' do
        it "calls the SomTimer API to get exercises (all)", :vcr do
          response = @facade.response_exercises

          expect(response).to be_a Hash
          expect(response).to have_key :count
          expect(response).to have_key :exercises
          expect(response[:count]).to be_a Integer
          expect(response[:count]).to eq(33)
          expect(response[:exercises]).to be_an Array
          exercise_1 = response[:exercises][0]
          expect(exercise_1).to have_key :id
          expect(exercise_1).to have_key :url
          expect(exercise_1).to have_key :duration
          expect(exercise_1).to have_key :category
          expect(exercise_1[:id]).to eq(1)
          expect(exercise_1[:url]).to eq("https://www.youtube.com/watch?v=W5wqniA4MMc&ab_channel=EssentialSomatics")
          expect(exercise_1[:duration]).to eq("10:00")
          expect(exercise_1[:category]).to eq("SomaticCategory.MEDITATION")
        end
      end

      describe '#exercises' do
        it "instantiates a series of exercise objects from the JSON response of get exercises (all)", :vcr do
          exercises = @facade.exercises

          expect(exercises).to be_an Array
          expect(exercises.length).to eq(33)
          exercise = exercises[0]
          expect(exercise).to be_a SomTimer::Exercise
          expect(exercise.id).to be_a Integer
          expect(exercise.id).to eq(1)
          expect(exercise.url).to be_a String
          expect(exercise.url).to eq("https://www.youtube.com/watch?v=W5wqniA4MMc&ab_channel=EssentialSomatics")
          expect(exercise.duration).to be_a String
          expect(exercise.duration).to eq("10:00")
          expect(exercise.category).to be_a String
          expect(exercise.category).to eq("MEDITATION")
        end
      end
    end

    # describe 'PUT timer (1)' do
    #   describe '#response_update_timer' do
    #     it "calls the SomTimer API to update timer (1)", :vcr do
    #       response = @facade.response_update_timer("10", "7", "chordCliff")
    #
    #       expect(response).to be_a Hash
    #       expect(response).to have_key :id
    #       expect(response).to have_key :work_interval
    #       expect(response).to have_key :rest_interval
    #       expect(response).to have_key :sound
    #       expect(response[:id]).to eq(1)
    #       expect(response[:work_interval]).to eq("10")
    #       expect(response[:rest_interval]).to eq("7")
    #       expect(response[:sound]).to eq("chordCliff")
    #     end
    #   end
    #
    #   describe '#update_timer' do
    #     it "instantiates a timer oject from the JSON response of updating timer (1)", :vcr do
    #       timer = @facade.update_timer("10", "7", "chordCliff")
    #
    #       expect(timer).to be_a SomTimer::Timer
    #       expect(timer.id).to be_a Integer
    #       expect(timer.id).to eq(1)
    #       expect(timer.work_interval).to be_a String
    #       expect(timer.work_interval).to eq("10")
    #       expect(timer.rest_interval).to be_a String
    #       expect(timer.rest_interval).to eq("7")
    #       expect(timer.sound).to be_a String
    #       expect(timer.sound).to eq("chordCliff")
    #     end
    #   end
    # end
  end
end
