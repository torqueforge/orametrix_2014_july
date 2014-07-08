class DrinkingSong
  def song
    verses(99, 0)
  end

  def verses(high, low)
    high.downto(low).collect { |num| verse(num) }.join("\n")
  end

  def verse(num)
    starting_inventory = Inventory.new(num)
    # TODO: Inventory#successor could return a new instance of Inventory
    ending_inventory = Inventory.new(starting_inventory.successor)

    "#{starting_inventory.amount} #{starting_inventory.container} of beer on the wall, ".capitalize +
    "#{starting_inventory.amount} #{starting_inventory.container} of beer.\n" +
    "#{starting_inventory.action}, " + 
    "#{ending_inventory.amount} #{ending_inventory.container} of beer on the wall.\n"
  end

end

class Inventory
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def amount
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def successor
    if number == 0
      99
    else
      number-1
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end
end
