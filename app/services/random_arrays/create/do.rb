require "dry/container"
require "dry/transaction"
require "dry/transaction/operation"

class RandomArrays::Create::Do
  include Dry::Transaction(container: Container)

  step :validate,        with: 'random_arrays.create.validate'
  step :generate_array,  with: 'random_arrays.create.generate_array'
  step :create_array,    with: 'random_arrays.create.create_array'
end
