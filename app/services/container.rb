require "dry/container"
require "dry/transaction"
require "dry/transaction/operation"

class Container
  extend Dry::Container::Mixin

  namespace "random_arrays" do
    namespace "create" do
      register("validate")        { RandomArrays::Create::Validate.new }
      register("generate_array")  { RandomArrays::Create::GenerateArray.new }
      register("create_array")    { RandomArrays::Create::CreateArray.new }
    end
  end
end
