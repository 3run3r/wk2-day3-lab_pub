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

  def test_customer_is_old_enough_for_the_pub__customer_is_underage
    assert_equal(false, @customer1.check_customer_is_legal)
  end

  def test_customer_is_old_enough_for_the_pub__customer_is_older_than_18
    assert_equal(true, @customer2.check_customer_is_legal)
  end

  def test_customer_is_old_enough_for_the_pub__customer_is_18
    assert_equal(true, @customer3.check_customer_is_legal)
  end

  def test_customer_intoxication__is_not_drunk
    assert_equal(true, @customer1.check_customer_intoxication_level)
  end

  def test_customer_intoxication__is_drunk
    assert_equal(true, @customer1.check_customer_intoxication_level)
  end

  def test_customer_has_enough_money_for_drink
    assert_equal(true, @customer1.check_customer_has_enough_money_for_drink(@drink1))
  end

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
