class Bottles
  def verse(num)
    case num
    when (3..99)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.
Take one down and pass it around, #{num-1} bottles of beer on the wall.
"
    when 2
"2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
"

    when 1
"1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
"
    when 0
"No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
"
    end
  end

  def verses(high, low)
    high.downto(low).collect { |num| verse(num) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end
