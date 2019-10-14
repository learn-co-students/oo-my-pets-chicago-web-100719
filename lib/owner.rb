class Owner
  attr_reader :name, :species
  @@count = 0
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@count += 1
    @@all << self
  end

  def say_species
    return "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
  self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats

    pets.each {|pet| pet.mood = "nervous"; pet.owner = nil}
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end