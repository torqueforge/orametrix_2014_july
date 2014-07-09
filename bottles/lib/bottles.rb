class Bottles
  def verse(num)

    old_inventory = Inventory.new(num)

    new_inventory = old_inventory.successor

      "#{old_inventory.amount.capitalize} #{old_inventory.container} of beer on the wall, #{old_inventory.amount} #{old_inventory.container} of beer.
#{old_inventory.what_to_do}, #{new_inventory.amount} #{new_inventory.container} of beer on the wall.
"
  end

  def verses(high, low)
    high.downto(low).map { |num| verse(num) }.join("\n")
  end

  def song
    verses(99, 0)
  end

end

 class Inventory
   attr_reader :number

   def initialize(number)
     @number = number
   end

  def container
    if(number == 1)
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun
    if number==1
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

  def what_to_do
    if(number == 0)
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def decrease_number
    (number + 99) % 100
  end

   def successor
        self.class.new(decrease_number)
   end
end