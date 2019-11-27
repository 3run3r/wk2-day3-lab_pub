class Customer

  attr_reader :name, :wallet, :age, :intoxication_level

  def initialize (name, age, wallet, intoxication_level = 0)
    @name = name
    @age = age
    @wallet = wallet
    @intoxication_level = intoxication_level
  end

  def reduce_wallet(drink)
    @wallet -= drink.price
  end





end
