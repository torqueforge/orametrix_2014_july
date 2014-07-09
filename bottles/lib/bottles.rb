class Bottles
  def verse(num)

    old_inventory = inventory_for(num)

    new_inventory = inventory_for(old_inventory.decrease_number)

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

  def inventory_for(num)
    if(num == 0)
      InventoryZero.new(num)
    elsif(num == 1)
      InventoryOne.new(num)
    else
      Inventory.new(num)
    end
  end

end

class SixPacks <Bottles
  def inventory_for(num)
    if(num == 6)
      InventurySixPack.new(num)
    else
      super
    end
  end
end

 class Inventory
   attr_reader :number

   def initialize(number)
     @number = number
   end

  def container
    "bottles"
  end

  def pronoun
   "one"
  end

  def amount
    number.to_s
  end

  def what_to_do
    "Take #{pronoun} down and pass it around"
  end

  def decrease_number
    number - 1
  end

 end

class InventoryZero <Inventory
  def amount
    "no more"
  end

  def what_to_do
    "Go to the store and buy some more"
  end

  def decrease_number
      99
  end
end
class InventoryOne <Inventory

  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end
class InventurySixPack <Inventory

  def amount
    "one"
  end

  def container
    "sixpack"
  end

  def what_to_do
    "Take one bottle down and pass it around"
  end

end