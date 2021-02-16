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

  describe "GET/random_arrays" do
    context "Get a largest range of random array" do
      it "Should return the new array" do
        random_array = create(:random_array)

        get "/api/v1/random_arrays/#{random_array.id}"

        body = JSON.parse(response.body)

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(201)

        expected_response = {"largest_range"=>[0, 7]}

        expect(body).to eq(expected_response)
      end

      it "Should return the new array" do
        random_array = create(:random_array, random_numbers: [1, 11, 3, 30, 12, 8, 2, 14, 10, 13])

        get "/api/v1/random_arrays/#{random_array.id}"

        body = JSON.parse(response.body)

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(201)

        expected_response = {"largest_range"=>[10, 14]}

        expect(body).to eq(expected_response)
      end
    end

    context "Get when the input is invalid" do
      it "Should return a failure" do
        get "/api/v1/random_arrays/123"

        body = JSON.parse(response.body)

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(401)

        expected_response = "The RandomArray with id 123 don't exist in database"

        expect(body["message"]).to eq(expected_response)
      end

      it "Should return a failure" do
        get "/api/v1/random_arrays/holis"

        body = JSON.parse(response.body)

        expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
        expect(response.status).to eq(401)

        expected_response = "The RandomArray with id 0 don't exist in database"

        expect(body["message"]).to eq(expected_response)
      end
    end
  end
end
