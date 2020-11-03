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

    describe 'GET rand_exercise' do
      before :each do
        path = "rand_exercise"
        @facade = SomTimer::ExerciseFacade.new(path)
      end
      describe '#response_rand_exercise' do
        it "calls the SomTimer API to get rand_exercise", :vcr do
          response = @facade.response_rand_exercise("10:00", "SOMATIC")

          expect(response).to be_a Hash
          expect(response).to have_key :id
          expect(response).to have_key :url
          expect(response).to have_key :duration
          expect(response).to have_key :category
          expect(response[:id]).to eq(32)
          expect(response[:url]).to eq("https://soundcloud.com/ucsdmindfulness/10-min-body-scan-by-christy-cassisa?in=ucsdmindfulness/sets/short-meditation-sessions")
          expect(response[:duration]).to eq("10:00")
          expect(response[:category]).to eq("SomaticCategory.SOMATIC")
        end
      end

      describe '#rand_exercise' do
        it "instantiates an exercise oject from the JSON response of retrieving a random exercise", :vcr do
          rand_exercise = @facade.rand_exercise("10:00", "SOMATIC")

          expect(rand_exercise).to be_a SomTimer::Exercise
          expect(rand_exercise.id).to be_a Integer
          expect(rand_exercise.id).to eq(33)
          expect(rand_exercise.url).to be_a String
          expect(rand_exercise.url).to eq("https://www.youtube.com/watch?v=zsCVqFr6j1g&feature=emb_logo")
          expect(rand_exercise.duration).to be_a String
          expect(rand_exercise.duration).to eq("10:00")
          expect(rand_exercise.category).to be_a String
          expect(rand_exercise.category).to eq("SOMATIC")
        end
      end
    end
  end
end
