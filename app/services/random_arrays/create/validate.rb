require "dry/transaction"
require "dry/transaction/operation"

class RandomArrays::Create::Validate
  include Dry::Transaction

  def call(input)
    validator = Dry::Validation.Schema do
      configure do
        config.messages_file = "config/locales/en.yml"

        def valid_range?(number_of_elements)
          Array(10..30).include?(number_of_elements)
        end
      end

        required(:number_of_elements).filled(:valid_range?)
    end

    result = validator.(input)

    if result.success?
      Success input
    else
      Failure result.errors
    end
  end
end
