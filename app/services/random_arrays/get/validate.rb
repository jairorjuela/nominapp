require "dry/transaction"
require "dry/transaction/operation"

class RandomArrays::Get::Validate
  include Dry::Transaction

  def call(input)
    validator = Dry::Validation.Schema do
      required(:id).filled(type?: Integer)
    end

    result = validator.(input)

    if result.success?
      Success input
    else
      Failure result.errors
    end
  end
end
