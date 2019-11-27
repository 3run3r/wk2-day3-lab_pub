require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')

class CustomerTest < Minitest::Test

def setup
    @drink1 = Drink.new('cider', 6)
    @customer1 = Customer.new('Matteo', 17, 85)
    @customer2 = Customer.new('Olivia', 27, 75)
    @customer3 = Customer.new('Cody', 18, 40)
end

def test_customer_has_name
  assert_equal('Matteo', @customer1.name)
end


def test_is_wallet_reduced
  @customer1.reduce_wallet(@drink1)
  assert_equal(79, @customer1.wallet)
end

def test_drink_

end

end
