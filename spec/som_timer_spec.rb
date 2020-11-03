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
          rests = SomTimer.rests

          expect(rests).to be_an Array
          expect(rests.count).to eq(9)
          rest = rests[0]
          expect(rest).to be_a SomTimer::Rest
          expect(rest.id).to be_a Integer
          expect(rest.id).to eq(1)
          expect(rest.mood_rating_1).to be_a Integer
          expect(rest.mood_rating_1).to eq(3)
          expect(rest.mood_rating_2).to be_a Integer
          expect(rest.mood_rating_2).to eq(5)
          expect(rest.content_selected).to be_a String
          expect(rest.content_selected).to eq("MOVEMENT")
          expect(rest.focus_interval).to be_a String
          expect(rest.focus_interval).to eq("25")
          expect(rest.rest_interval).to be_a String
          expect(rest.rest_interval).to eq("5")
        end
      end

      describe ".rand_exercise" do
        it "GET request to retrieve a random exercise", :vcr do
          rand_exercise = SomTimer.rand_exercise("10:00", "SOMATIC")

          expect(rand_exercise).to be_a SomTimer::Exercise
          expect(rand_exercise.id).to be_a Integer
          expect(rand_exercise.id).to eq(32)
          expect(rand_exercise.url).to be_a String
          expect(rand_exercise.url).to eq("https://soundcloud.com/ucsdmindfulness/10-min-body-scan-by-christy-cassisa?in=ucsdmindfulness/sets/short-meditation-sessions")
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
          rest = SomTimer.create_rest(2, 4, "SOMATIC", "25", "5")

          expect(rest).to be_a SomTimer::Rest
          expect(rest.id).to be_a Integer
          expect(rest.id).to eq(17)
          expect(rest.mood_rating_1).to be_a Integer
          expect(rest.mood_rating_1).to eq(3)
          expect(rest.mood_rating_2).to be_a Integer
          expect(rest.mood_rating_2).to eq(5)
          expect(rest.content_selected).to be_a String
          expect(rest.content_selected).to eq("SOMATIC")
          expect(rest.focus_interval).to be_a String
          expect(rest.focus_interval).to eq("25")
          expect(rest.rest_interval).to be_a String
          expect(rest.rest_interval).to eq("5")
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
