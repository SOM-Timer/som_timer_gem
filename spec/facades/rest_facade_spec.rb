require 'spec_helper'

RSpec.describe SomTimer::RestFacade do
  describe 'instance methods' do
    before :each do
      path = "rests"
      @facade = SomTimer::RestFacade.new(path)
    end
    describe 'GET rests (all)' do
      describe '#response_rests' do
        it "calls the SomTimer API to get rests (all)", :vcr do
          response = @facade.response_rests

          expect(response).to be_a Hash
          expect(response).to have_key :count
          expect(response).to have_key :rests
          expect(response[:count]).to be_a Integer
          expect(response[:count]).to eq(9)
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

      describe '#rests' do
        it "instantiates a series of rest object from the JSON response of get rests (all)", :vcr do
          rests = @facade.rests

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
    end

    describe 'POST rest' do
      describe '#response_create_rest' do
        it "calls the SomTimer API to create rest" do
          response = @facade.response_create_rest(3, 5, "SOMATIC", "25", "5")

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

      describe '#create_rest' do
        it "instantiates a rest oject from the JSON response of creating rest" do
          rest = @facade.create_rest(3, 5, "SOMATIC", "25", "5")

          expect(rest).to be_a SomTimer::Rest
          expect(rest.id).to be_a Integer
          expect(rest.id).to eq(1)
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
    end
  end
end
