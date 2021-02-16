require 'rails_helper'

RSpec.describe RandomArrays::Create::Do do
  describe "#call" do
    let(:input)     { { number_of_elements: 10 } }

    context "When the input is valid" do
      it "Should return a success response" do
        expect(RandomArray.count).to be_zero

        response = subject.(input)

        expect(response).to be_success
        expect(RandomArray.count).to eq(1)

        expected_response = {
          number_of_elements: 10,
          random_array: RandomArray.last.random_numbers,
          random_array_id: RandomArray.last.id
        }

        expect(response.success).to eq(expected_response)
        expect(response.success[:random_array].length).to eq(input[:number_of_elements])
      end
    end

    context "When the input is invalid" do
      it "Should return a failure response if the input is less than 10" do
        expect(RandomArray.count).to be_zero
        input[:number_of_elements] = 5

        response = subject.(input)

        expect(response).to be_failure
        expect(RandomArray.count).to eq(0)

        expected_response = { number_of_elements: ["The input should be a number minimum of 10 max 30"] }

        expect(response.failure).to eq(expected_response)
      end

      it "Should return a failure response if the input is bigger than 30" do
        expect(RandomArray.count).to be_zero
        input[:number_of_elements] = 35

        response = subject.(input)

        expect(response).to be_failure
        expect(RandomArray.count).to eq(0)

        expected_response = { number_of_elements: ["The input should be a number minimum of 10 max 30"] }

        expect(response.failure).to eq(expected_response)
      end
    end
  end
end
