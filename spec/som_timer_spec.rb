require 'spec_helper'

describe SomTimer do
  describe "ReST Endpoints" do
    describe "successful request" do
      describe ".one_timer" do
        it "GET request to retrieve timer (1)", :vcr do
          timer = SomTimer.one_timer

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

      describe ".exercises" do
        it "GET request to retrieve all exercises", :vcr do
          exercises = SomTimer.exercises

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

      describe ".rests" do
        it "GET request to retrieve all rests", :vcr do
          response = SomTimer.rests

          expect(response).to be_a Hash
          expect(response).to have_key :count
          expect(response).to have_key :rests
          expect(response[:count]).to be_a Integer
          expect(response[:count]).to eq(1)
          expect(response[:rests]).to be_an Array
          rest_1 = response[:rests][0]
          expect(rest_1).to have_key :id
          expect(rest_1).to have_key :mood_rating_1
          expect(rest_1).to have_key :mood_rating_2
          expect(rest_1).to have_key :content_selected
          expect(rest_1).to have_key :focus_interval
          expect(rest_1).to have_key :rest_interval
          expect(rest_1[:id]).to eq(1)
          expect(rest_1[:mood_rating_1]).to eq(3)
          expect(rest_1[:mood_rating_2]).to eq(5)
          expect(rest_1[:content_selected]).to eq("MOVEMENT")
          expect(rest_1[:focus_interval]).to eq("25")
          expect(rest_1[:rest_interval]).to eq("5")
        end
      end

      describe ".rand_exercise" do
        it "GET request to retrieve a random exercise", :vcr do
          rand_exercise = SomTimer.rand_exercise("10:00", "SOMATIC")

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

      describe ".update_timer" do
        it "PUT request to update timer (1)", :vcr do
          timer = SomTimer.update_timer("25:00", "5:00", "chordCliff")

          expect(timer).to be_a SomTimer::Timer
          expect(timer.id).to be_a Integer
          expect(timer.id).to eq(1)
          expect(timer.work_interval).to be_a String
          expect(timer.work_interval).to eq("25:00")
          expect(timer.rest_interval).to be_a String
          expect(timer.rest_interval).to eq("5:00")
          expect(timer.sound).to be_a String
          expect(timer.sound).to eq("chordCliff")
        end
      end

      describe ".create_rest" do
        it "POST request to create a rest", :vcr do
          response = SomTimer.create_rest(2, 4, "SOMATIC", "25", "5")

          expect(response).to be_a Hash
          expect(response).to have_key :id
          expect(response).to have_key :mood_rating_1
          expect(response).to have_key :mood_rating_2
          expect(response).to have_key :content_selected
          expect(response).to have_key :focus_interval
          expect(response).to have_key :rest_interval
          expect(response[:id]).to eq(2)
          expect(response[:mood_rating_1]).to eq(2)
          expect(response[:mood_rating_2]).to eq(4)
          expect(response[:content_selected]).to eq("SOMATIC")
          expect(response[:focus_interval]).to eq("25")
          expect(response[:rest_interval]).to eq("5")
        end
      end

      describe ".hello_world" do
        it "Som Timer Welcome Message returns nil" do
          expect(SomTimer.hello_world).to eq(nil)
        end
      end
    end
  end
end
