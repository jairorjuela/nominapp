require "dry/transaction"
require "dry/transaction/operation"

class RandomArrays::Get::GetRanges
  include Dry::Transaction

  def call(input)
    get_all_ranges = get_ranges(input[:random_array].random_numbers.sort)

    if !get_all_ranges.empty?
      Success input.merge(all_ranges: get_all_ranges)
    else
      Failure ({ message: "The RandomRange does not have ranges", code: 10104 })
    end
  end

  private
  def get_ranges(random, array = [])
    return array if random.length.eql?(0)

    active_while = true
    memory = []

    while active_while
      if random.length > 1
        if (random[1] - random[0]).eql?(1)
          memory << random[0] << random[1]
          random.delete(random[0])
        else
          array << memory if memory.length > 0
          random.delete(random[0])
          memory = (random & memory )
        end
      else
        random.delete(random[0])
        active_while = false
      end
    end

    get_ranges(random, array)
  end
end
