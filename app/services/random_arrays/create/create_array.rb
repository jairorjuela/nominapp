require "dry/transaction"
require "dry/transaction/operation"

class RandomArrays::Create::CreateArray
  include Dry::Transaction

  def call(input)
    random_array = RandomArray.new( {random_numbers: input[:random_array]} )

    if random_array.save
      Success input.merge(random_array_id: random_array.id, random_array: random_array.random_numbers)
    else
      Failure ({ message: "The object RandomArray can't be created", code: 10104 })
    end
  end
end
