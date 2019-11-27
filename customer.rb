class Customer

  attr_reader :name, :wallet, :age, :intoxication_level

  def initialize (name, age, wallet, intoxication_level = 0)
    @name = name
    @age = age
    @wallet = wallet
    @intoxication_level = intoxication_level
  end

  def check_customer_is_legal
    return @age >= 18
  end

  def check_customer_intoxication_level
    return @intoxication_level < 8
  end

  def check_customer_has_enough_money_for_drink(drink)
    return @wallet >= drink.price
  end
  
  def buy_drink(drink)
    @wallet -= drink.price
    @intoxication_level += drink.alcohol_level
  end

  def buy_food(food)
    @wallet -= food.price
    @intoxication_level -= food.rejuvenation_level
  end

end
