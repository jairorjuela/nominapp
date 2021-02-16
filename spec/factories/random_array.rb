FactoryBot.define do
  factory :random_array do
    random_numbers  { [0, 1, 3, 13, 15, 5, 2, 4, 10, 7, 12, 6] }
  end
end
