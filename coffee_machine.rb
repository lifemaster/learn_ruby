class CoffeeMachine

  class WrongParameter < StandardError; end

  WATER_HEAT_CAPACITY = 4200

  attr_reader :water_amount

  def initialize(power, capacity)
    @power = power
    @capacity = capacity
    @water_amount = 0
  end

  def pour_in_water_amount(value)
    begin
      raise self.class::WrongParameter if value > @capacity - @water_amount
      @water_amount += value
      puts "The coffeeMachine has #{@water_amount} ml water!"
    rescue self.class::WrongParameter
      puts "Your water amount = #{value} ml is more, then can fit into coffee machine!
      Here capacity = #{@capacity} ml, water inside = #{@water_amount} ml. Sorry..."
    end
  end

  def pour_out_water_amount(value)
    begin
      raise self.class::WrongParameter if value > @water_amount
      @water_amount -= value
      puts "The coffeeMachine has #{@water_amount} ml water!"
    rescue self.class::WrongParameter
      puts "The coffeeMachine has #{@water_amount} ml water. It's less, then #{value}"
    end
  end

  def boil_time
    (@water_amount / 1000.0 * WATER_HEAT_CAPACITY * 80 / @power).round
  end

  def run
    begin
      raise self.class::WrongParameter if @water_amount.zero?
      puts "Coffee will be ready after #{get_boil_time} sec. Please, wait..."
      sleep get_boil_time
      puts "Coffee ready!"
    rescue self.class::WrongParameter
      puts "Coffee machine is empty. Please, pour in water first"
    end
  end

end