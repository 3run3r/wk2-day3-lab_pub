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

def check_customer_is_legal(customer)
    return customer.age >= 18
end

def check_customer_intoxication_level(customer)
  return customer.intoxication_level < 8
end

def check_customer_has_enough_money_for_drink(customer, drink)
  return customer.wallet >= drink.price
end

def sells_drink(customer, drink)
  if check_customer_is_legal(customer) && check_customer_intoxication_level(customer) && check_customer_has_enough_money_for_drink(customer, drink)
    add_to_till(drink)
    customer.reduce_wallet(drink)
  end
end


end
