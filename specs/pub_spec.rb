require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../customer')
require_relative('../drink')

class PubTest < Minitest::Test

  def setup
    @customer1 = Customer.new('Matteo', 17, 85, 5)
    @customer2 = Customer.new('Olivia', 27, 75, 5)
    @customer3 = Customer.new('Cody', 18, 40, 15)
    @drink1 = Drink.new('cider', 6)
    @drink2 = Drink.new('beer', 5)
    @drink3 = Drink.new('cocktail', 8)
    @starting_drinks = [@drink1, @drink2, @drink3]
    @pub1 = Pub.new('4042', 1000, @starting_drinks)
  end

  def test_does_pub_have_name
    assert_equal('4042', @pub1.name)
  end

  def test_does_pub_till_go_up_when_selling_drink
    @pub1.add_to_till(@drink3)
    assert_equal(1008, @pub1.till)
  end

  # def test_does_pub_stock_go_down_when_selling_drink
  #
  # end

#Tests for entry
  def test_customer_is_old_enough_for_the_pub__customer_is_underage
    assert_equal(false, @pub1.check_customer_is_legal(@customer1))
  end

  def test_customer_is_old_enough_for_the_pub__customer_is_older_than_18
    assert_equal(true, @pub1.check_customer_is_legal(@customer2))
  end

  def test_customer_is_old_enough_for_the_pub__customer_is_18
    assert_equal(true, @pub1.check_customer_is_legal(@customer3))
  end

#Tests for when selling a drink
  def test_customer_intoxication__is_not_drunk
    assert_equal(true, @pub1.check_customer_intoxication_level(@customer1))
  end

  def test_customer_intoxication__is_drunk
    assert_equal(true, @pub1.check_customer_intoxication_level(@customer2))
  end

  def test_customer_has_enough_money_for_drink
    assert_equal(true, @pub1.check_customer_has_enough_money_for_drink(@customer2, @drink2))
  end



  # def test_customer_can_buy_drink
  #   @pub1.sells_drink(@customer2, @drink1)
  #   assert_equal(true, @pub1.check_customer_is_legal(@customer2))
  #   assert_equal(true, @pub1.check_customer_intoxication_level(@customer2))
  #   assert_equal(true, @customer2.wallet)
  #
  # end


end
