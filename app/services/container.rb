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

    namespace "get" do
      register("validate")         { RandomArrays::Get::Validate.new }
      register("find_array")       { RandomArrays::Get::FindArray.new }
      register("get_ranges")       { RandomArrays::Get::GetRanges.new }
      register("build_response")   { RandomArrays::Get::BuildResponse.new }
    end
  end
end
