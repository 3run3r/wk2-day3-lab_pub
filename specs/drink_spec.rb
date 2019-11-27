require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class DrinkTest < Minitest::Test

def setup

  @drink1 = Drink.new('cider', 6, 2)

end

def test_drink_has_name
  assert_equal('cider', @drink1.name)
end

def test_drink_has_price
  assert_equal(6, @drink1.price)
end

end
