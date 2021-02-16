require "dry/transaction"
require "dry/transaction/operation"

class RandomArrays::Create::GenerateArray
  include Dry::Transaction

  def call(input)
    random_array = generate_array(input[:number_of_elements])

    if random_array.length.eql?(input[:number_of_elements])
      Success input.merge(random_array: random_array)
    else
      Failure ({ message: "The Array can't be created", code: 10104 })
    end
  end

  private
  def generate_array(limit, array = [])
    return array if array.length.eql?(limit)

    random_number = rand(30)
    array << random_number
    array.uniq

    generate_array(limit, array)
  end
end
