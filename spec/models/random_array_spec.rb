require 'rails_helper'

RSpec.describe RandomArray, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:random_numbers) }
  end

  describe "The random_array values are valid" do
    it "Should create the RandomArray" do
      subject.random_numbers = [0, 1, 3, 13, 15, 5, 2, 4, 10, 7, 12, 6]

      expect(subject).to be_valid
    end
  end

  describe "The random_array values are not valid" do
    describe "the input is not an array" do
      it "Should not create the RandomArray" do
        subject.random_numbers = "test"

        expect(subject).to be_invalid
        expect(subject.errors.messages[:random_numbers]).to match_array("can't be blank") 
      end
    end
  end
end
