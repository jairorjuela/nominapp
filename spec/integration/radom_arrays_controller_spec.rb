require 'swagger_helper'
require 'rails_helper'

RSpec.describe "RandomArrays API", :type => :request do
  path "/api/v1/random_arrays" do
    post 'Create a random array' do
      tags 'RandomArrays'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :input, in: :body, schema: {
        type: :object,
        properties: {
          number_of_elements: { type: :integer },
        },
        required: [ 'number_of_elements' ]
      }

      response '201', 'The rate creation is ok' do
        let(:input) { { number_of_elements: 11 } }

        schema type: :object,
          required: [ 'number_of_elements', 'random_array', 'random_array_id' ],
          properties: {
            type: :object,
            properties: {
              number_of_elements: { type: :integer },
              random_array: { type: :array },
              random_array_id: { type: :integer},
            }
          }

        run_test!
      end

      response '401', 'The input is invalid' do
        let(:input) { { id: 1 } }

        schema type: :object,
        required: [],
        properties: {
          number_of_elements: { type: :hash },
          extra: { type: :hash },
          code: { type: :hash },
          error: { type: :hash }
        }

        run_test!
      end
    end
  end

  path "/api/v1/random_arrays/{id}" do
    get 'Create a random array' do
      tags 'RandomArrays'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '201', 'The rate creation is ok' do
        let(:random_array)  { create(:random_array) }
        let(:id)            { random_array.id }

        schema type: :object,
          required: [ 'largest_range' ],
          properties: {
            type: :object,
            properties: {
              largest_range: { type: :object },
            }
          }

        run_test!
      end

      response '401', 'The input is invalid' do
        let(:id) { "blah" }

        schema type: :object,
        required: [],
        properties: {
          largest_range: { type: :hash },
          extra: { type: :hash },
          code: { type: :hash },
          error: { type: :hash }
        }

        run_test!
      end
    end
  end
end
