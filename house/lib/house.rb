# Feel free to delete the instructions once you get going
puts instructions(__FILE__)

class House
  attr_reader :lines

  def initialize
    read("LYRICS.txt")
  end

  def read(filename)
    @lines = IO.readlines(filename)
  end

  def line(line_no)
    @lines[line_no-1] # compensate 0-based line index
  end

  def recite
    @lines.join("\n");
  end
end

# alternate version

class House2
  attr_reader :lines

  def initialize
    @lines = IO.readlines("LYRICS_orig.txt")
  end

  def line(line_no)
    @lines[(line_no-1) * 2] # compensate 0-based line index
  end

  def recite
    @lines.join("")
  end
end
