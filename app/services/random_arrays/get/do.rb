require "dry/container"
require "dry/transaction"
require "dry/transaction/operation"

class RandomArrays::Get::Do
  include Dry::Transaction(container: Container)

  step :validate,        with: 'random_arrays.get.validate'
  step :find_array,      with: 'random_arrays.get.find_array'
  step :get_ranges,      with: 'random_arrays.get.get_ranges'
  step :build_response,  with: 'random_arrays.get.build_response'
end
