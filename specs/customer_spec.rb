require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')

class CustomerTest < Minitest::Test

def setup
    @drink1 = Drink.new('cider', 6, 2)
    @customer1 = Customer.new('Matteo', 17, 85, 5)
    @customer2 = Customer.new('Olivia', 27, 75, 5)
    @customer3 = Customer.new('Cody', 18, 40, 15)
end

def test_customer_has_name
  assert_equal('Matteo', @customer1.name)
end


def test_is_wallet_reduced
  @customer1.reduce_wallet(@drink1)
  assert_equal(79, @customer1.wallet)
end

def test_drink_increases_intoxication
  @customer1.take_a_drink(@drink1)
  assert_equal(7, @customer1.intoxication_level)
end

end
