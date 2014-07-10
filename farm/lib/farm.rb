using Article

class Farm
  attr_reader :animals

  def initialize(ids)
    @animals = AnimalWrapper.all(ids)
  end

  def lyrics
    animals.collect {|animal| verse(animal) }.join("\n\n")

  end

  private
  def verse(animal)
    "Old MacDonald had a farm, E-I-E-I-O,\n" +
    "And on that farm he had #{animal.species.articlize}, E-I-E-I-O,\n" +
    "With #{animal.sound.articlize} #{animal.sound} here " +
      "and #{animal.sound.articlize} #{animal.sound} there,\n" +
    "Here #{animal.sound.articlize}, there #{animal.sound.articlize}, " +
      "everywhere #{animal.sound.articlize} #{animal.sound},\n" +
    "Old MacDonald had a farm, E-I-E-I-O."
  end
end

class NotAnimal
  SILENCE ='<silence>'
     def species
       SILENCE
     end

     def sound
       SILENCE
     end
end


module AnimalWrapper
  def self.all(ids)
    Animal.all(ids).map {|animal| animal || NotAnimal.new}
  end
end