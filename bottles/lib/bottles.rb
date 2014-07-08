class Bottles
  def song
    verses(99, 0)
  end

  def verses(high, low)
    high.downto(low).collect { |num| verse(num) }.join("\n")
  end

  def verse(num)
    "#{amount(num).capitalize} #{container(num)} of beer on the wall, #{amount(num)} #{container(num)} of beer.\n" +
    "#{action(num)}, #{amount(successor(num))} #{container(successor(num))} of beer on the wall.\n"
  end

  def container(count)
    if count == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun(count)
    if count == 1
      "it"
    else
      "one"
    end
  end

  def amount(count)
    if count == 0
      "no more"
    else
      count.to_s
    end
  end

  def successor(num)
    if num == 0
      99
    else
      num-1
    end
  end

  def action(num)
    if num == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(num)} down and pass it around"
    end
  end
end
