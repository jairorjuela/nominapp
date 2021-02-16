class CreateRandomArrays < ActiveRecord::Migration[5.2]
  def change
    create_table :random_arrays do |t|
      t.integer 'random_numbers', array: true

      t.timestamps
    end
  end
end
