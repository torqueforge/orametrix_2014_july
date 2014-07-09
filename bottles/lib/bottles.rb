class Bottles
  def song
    verses(99, 0)
  end

  def verses(high, low)
    high.downto(low).collect { |num| verse(num) }.join("\n")
  end

  def verse(num)
    chunk = VerseChunk.new(num)
    successor_chunk = VerseChunk.new(chunk.successor)
    "#{chunk.amount} #{chunk.container} of beer on the wall, ".capitalize +
    "#{chunk.amount} #{chunk.container} of beer.\n" +
    "#{chunk.action}, " +
    "#{successor_chunk.amount} #{successor_chunk.container} of beer on the wall.\n"
  end

end

class VerseChunk
  attr_reader :count
  def initialize(count)
    @count = count
  end

  def container
    if count == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun
    if count == 1
      "it"
    else
      "one"
    end
  end

  def amount
    if count == 0
      "no more"
    else
      count.to_s
    end
  end

  def successor
    if count == 0
      99
    else
      count-1
    end
  end

  def action
    if count == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end
end
