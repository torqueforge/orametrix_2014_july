class Bottles
  def song
    verses(99, 0)
  end

  def verses(high, low)
    high.downto(low).collect { |num| verse(num) }.join("\n")
  end

  def verse(num)
    case num
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{num} #{container(num)} of beer on the wall, #{num} #{container(num)} of beer.\nTake #{pronoun(num)} down and pass it around, #{amount(num-1)} #{container(num-1)} of beer on the wall.\n"
    end
  end

private
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

  def amount(num)
    if num == 0
      "no more"
    else
      num
    end
  end
end
