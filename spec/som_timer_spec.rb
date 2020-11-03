require 'spec_helper'

describe SomTimer do
  describe "ReST Endpoints" do
    describe "successful request" do
      describe ".one_timer" do
        it "GET request to retrieve timer (1)", :vcr do
          response = SomTimer.one_timer

          expect(response).to be_a Hash
          expect(response).to have_key :id
          expect(response).to have_key :work_interval
          expect(response).to have_key :rest_interval
          expect(response).to have_key :sound
          expect(response[:id]).to eq(1)
          expect(response[:work_interval]).to eq(".5")
          expect(response[:rest_interval]).to eq("5")
          expect(response[:sound]).to eq("birdChord")
        end
      end

      describe ".exercises" do
        it "GET request to retrieve all exercises", :vcr do
          response = SomTimer.exercises

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

      describe ".rand_exercise" do
        it "GET request to retrieve a random exercise", :vcr do
          response = SomTimer.rand_exercise("10:00", "SOMATIC")

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

      describe ".update_timer" do
        it "PUT request to update timer (1)", :vcr do
          response = SomTimer.update_timer("25:00", "5:00", "chordCliff")

          expect(response).to be_a Hash
          expect(response).to have_key :id
          expect(response).to have_key :work_interval
          expect(response).to have_key :rest_interval
          expect(response).to have_key :sound
          expect(response[:id]).to eq(1)
          expect(response[:work_interval]).to eq("25:00")
          expect(response[:rest_interval]).to eq("5:00")
          expect(response[:sound]).to eq("chordCliff")
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
