puts "Creating Randoms Array"

RandomArray.create({ random_numbers: [0, 1, 3, 13, 15, 5, 2, 4, 10, 7, 12, 6] })
RandomArray.create({ random_numbers: [1, 11, 3, 30, 12, 8, 2, 14, 10, 13] })

puts "In the database are the arrays #{RandomArray.all.map(&:random_numbers)}"
