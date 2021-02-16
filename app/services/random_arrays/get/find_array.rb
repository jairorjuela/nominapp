require "dry/transaction"
require "dry/transaction/operation"

class RandomArrays::Get::FindArray
  include Dry::Transaction

  def call(input)
    random_array = RandomArray.find_by(id: input[:id])

    if random_array.present?
      Success input.merge(random_array: random_array)
    else
      Failure ({ message: "The RandomArray with id #{input[:id]} don't exist in database", code: 10104 })
    end
  end
end
