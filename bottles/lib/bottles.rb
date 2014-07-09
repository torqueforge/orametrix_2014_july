class Bottles
  def song
    verses(99, 0)
  end

  def verses(high, low)
    high.downto(low).collect { |num| verse(num) }.join("\n")
  end

  def verse(num)
    chunk = chunk_for(num)
    successor_chunk = chunk_for(chunk.successor)
    "#{chunk.amount} #{chunk.container} of beer on the wall, ".capitalize +
    "#{chunk.amount} #{chunk.container} of beer.\n" +
    "#{chunk.action}, " +
    "#{successor_chunk.amount} #{successor_chunk.container} of beer on the wall.\n"
  end

  def chunk_for(num)
    case num
      when 0
        VerseChunkZero.new(num)
      when 1
        VerseChunkOne.new(num)
      when 6
        VerseChunkSix.new(num)
      else
        VerseChunk.new(num)
    end
  end
end

class VerseChunk
  attr_reader :count
  def initialize(count)
    @count = count
  end

  def container
     "bottles"
  end

  def pronoun
     "one"
  end

  def amount
      count.to_s
  end

  def successor
      count-1
   end

  def action
      "Take #{pronoun} down and pass it around"
  end
end

class VerseChunkZero < VerseChunk
  def amount
     "no more"
  end

  def successor
      99
  end

  def action
    "Go to the store and buy some more"
  end

end

class VerseChunkOne < VerseChunk
  def container
      "bottle"
  end

  def pronoun
    "it"
  end
end

class VerseChunkSix < VerseChunk
   def container
     "six-pack"
   end

   def amount
     "1"
   end
end