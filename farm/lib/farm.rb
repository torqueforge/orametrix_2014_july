using Article


class Farm
  attr_reader :ids

  def initialize(ids)
    @ids = ids
  end

  def lyrics
    Animal.all(ids).collect {|animal| verse(animal) }.join("\n\n")
  end

  def verse(animal)
    if animal.nil?
      species = '<silence>'
      sound = '<silence>'
    else
      species = animal.species
      sound = animal.sound
    end

    "Old MacDonald had a farm, E-I-E-I-O,\n" +
    "And on that farm he had #{species.articlize}, E-I-E-I-O,\n" +
    "With #{sound.articlize} #{sound} here " +
      "and #{sound.articlize} #{sound} there,\n" +
    "Here #{sound.articlize}, there #{sound.articlize}, " +
      "everywhere #{sound.articlize} #{sound},\n" +
    "Old MacDonald had a farm, E-I-E-I-O."

  end
end


