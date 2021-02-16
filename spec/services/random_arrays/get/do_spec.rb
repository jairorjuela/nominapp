require 'rails_helper'

RSpec.describe RandomArrays::Get::Do do
  describe "#call" do
    let!(:random)    { create(:random_array) }
    let(:input)      { { id: random.id } }

    context "When the input is valid" do
      it "Should return a success response" do
        expect(RandomArray.count).to eq(1)

        response = subject.(input)

        expect(response).to be_success
        expect(RandomArray.count).to eq(1)

        expected_response = { largest_range: [0, 7] }

        expect(response.success).to eq(expected_response)
      end

      it "Should return a success response" do
        random2 = create(:random_array, random_numbers: [1, 11, 3, 30, 12, 8, 2, 14, 10, 13])
        input[:id] = random2.id

        response = subject.(input)

        expect(response).to be_success

        expected_response = { largest_range: [10, 14] }

        expect(response.success).to eq(expected_response)
      end
    end

    context "When the input is invalid" do
      it "Should return a failure response if not exist a RandomArray whit id input" do
        input[:id] = 125

        response = subject.(input)

        expect(response).to be_failure

        expected_response = "The RandomArray with id 125 don't exist in database"

        expect(response.failure[:message]).to eq(expected_response)
      end

      it "Should return a failure response if the input is a String class" do
        input[:id] = "holi"

        response = subject.(input)

        expect(response).to be_failure

        expect(response.failure).to eq({:id=>["must be Integer"]})
      end
    end
  end
end
