require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')
require_relative('../food')

class CustomerTest < Minitest::Test

  def setup
    @food1 = Food.new("Burger", 5, 2)
    @drink1 = Drink.new('cider', 6, 2)
    @customer1 = Customer.new('Matteo', 17, 85, 5)
    @customer2 = Customer.new('Olivia', 27, 75, 5)
    @customer3 = Customer.new('Cody', 18, 40, 15)
  end

  def test_customer_has_name
    assert_equal('Matteo', @customer1.name)
  end


  # def test_is_wallet_reduced
  #   @customer1.reduce_wallet(@drink1)
  #   assert_equal(79, @customer1.wallet)
  # end
  #
  # def test_drink_increases_intoxication
  #   @customer1.take_a_drink(@drink1)
  #   assert_equal(7, @customer1.intoxication_level)
  # end

  def test_customer_has_bought_drink
    @customer1.buy_drink(@drink1)
    assert_equal(79, @customer1.wallet)
    assert_equal(7, @customer1.intoxication_level)
  end

  def test_customer_intoxication_and_wallet_amount_go_down_when_eating
    @customer3.buy_food(@food1)
    assert_equal(35, @customer3.wallet)
    assert_equal(13, @customer3.intoxication_level)
  end


end
