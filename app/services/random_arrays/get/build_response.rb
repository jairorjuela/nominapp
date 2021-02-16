require "dry/transaction"
require "dry/transaction/operation"

class RandomArrays::Get::BuildResponse
  include Dry::Transaction

  def call(input)
    response = build_response(input[:all_ranges])

    if response.present?
      Success ({ largest_range: response })
    else
      Failure ({ message: "The RandomArray does not have largest_range", code: 10104 })
    end
  end

  private
  def build_response(ranges, response = [])
    clean_ranges = ranges.map(&:uniq).max_by(&:length)
    
    response << clean_ranges.min << clean_ranges.max
  end
end
