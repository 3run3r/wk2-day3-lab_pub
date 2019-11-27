require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food')

class FoodTest < Minitest::Test

  def setup
    @food = Food.new("Burger", 5, 2)
  end

  def test_can_get_food_name
    assert_equal("Burger", @food.name)
  end

end
