class Bottles
  def song
    verses(99, 0)
  end

  def verses(high, low)
    high.downto(low).collect { |num| verse(num) }.join("\n")
  end

  def verse(num)
    "#{amount(num).capitalize} #{container(num)} of beer on the wall, "  +
    "#{amount(num)} #{container(num)} of beer.\n" +
    "#{end_phrase(num)} #{amount(num-1)} #{container(num-1)} of beer on the wall.\n"
  end

  private
  def container(num)
    if num == 1
      "bottle"
    else
      "bottles"
    end
  end

  def it_or_one(num)
    if num == 1
      "it"
    else
      "one"
    end
  end

  def amount(num)
    if num == 0
      "no more"
    elsif num <  0
      "99"
    else
      num.to_s
    end
  end

  def end_phrase(num)
    if num == 0
      "Go to the store and buy some more,"
    else
      "Take #{it_or_one(num)} down and pass it around,"
    end
  end
end
