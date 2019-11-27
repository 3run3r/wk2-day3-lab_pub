class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks = [])
    @name = name
    @till = till
    @drinks = drinks
  end

  def add_to_till(drink)
    @till += drink.price
  end



  # def check_customer_can_have_drink(customer, drink)
  #   if check_customer_intoxication_level(customer) && check_customer_has_enough_money_for_drink(customer, drink)
  # end

  def sells_drink(customer, drink)
    if customer.check_customer_is_legal && customer.check_customer_intoxication_level && customer.check_customer_has_enough_money_for_drink(drink)
      add_to_till(drink)
      customer.buy_drink(drink)
    end
  end


end
