class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def say_species
    p "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {
      |cat| cat.owner == self
    }
  end

  def dogs
    Dog.all.select {
      |dog| dog.owner == self
    }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {
      |dog| dog.mood = "happy"
    }
  end

  def feed_cats
    cats.each {
      |cat| cat.mood = "happy"
    }
  end

  def list_pets
    p "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def sell_pets
    all_pets = dogs + cats
    all_pets.each {
      |pet| pet.mood = "nervous"
      pet.owner = nil
    } 
  end


end