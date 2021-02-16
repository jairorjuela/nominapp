require 'rails_helper'

RSpec.describe Api::V1::RandomArraysController, :type => :request do
  describe "POST/random_arrays" do
    context "Create a new random array" do
      it "Should return the new array" do
        params = { number_of_elements: 10 }

        post "/api/v1/random_arrays", params: params

        body = JSON.parse(response.body)

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(201)

        expected_response = ["number_of_elements", "random_array", "random_array_id"]
        expect(body.keys).to eq(expected_response)
      end
    end

    context "When the input is invalid" do
      it "Should return the error" do
        params = { number_of_elements: 1 }

        post "/api/v1/random_arrays", params: params

        body = JSON.parse(response.body)

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(401)

        expected_response = ["The input should be a number minimum of 10 max 30"]
        expect(body["number_of_elements"]).to eq(expected_response)
      end

      it "Should return the error" do
        params = { number_of_elements: 100 }

        post "/api/v1/random_arrays", params: params

        body = JSON.parse(response.body)

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(401)

        expected_response = ["The input should be a number minimum of 10 max 30"]
        expect(body["number_of_elements"]).to eq(expected_response)
      end

      it "Should return the error" do
        params = { number_of_elements: "holi" }

        post "/api/v1/random_arrays", params: params

        body = JSON.parse(response.body)

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(401)

        expected_response = ["The input should be a number minimum of 10 max 30"]
        expect(body["number_of_elements"]).to eq(expected_response)
      end
    end
  end
end
