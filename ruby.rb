class MyCar
  attr_reader :year, :model, :speed
  attr_accessor :color
  def initialize(year, color, model,speed = 0)
    @year = year
    @color = color
    @model = model
    @speed = speed
  end

  def speed_up(n)
    @speed += n
  end

  def break(n)
    @speed -= n
  end

  def car_off
    @speed = 0
  end

  def spray_paint
    puts "what color?"
    a = gets.chomp
    @color = a
    puts "New color is #{@color}"
  end
  @@rr = 1
end

class Test < MyCar
  def initialize
    puts @@rr + 1
  end
end

Test.new

new_car = MyCar.new(11,'gray','SSx-11')
puts "#{new_car.year} #{new_car.color} #{new_car.model} #{new_car.speed}"
puts new_car.speed_up(44)
puts new_car.break(14)
puts new_car.speed
puts new_car.car_off
puts new_car.year
new_car.color = 'blue'
puts new_car.color

new_car.spray_paint
puts new_car.color