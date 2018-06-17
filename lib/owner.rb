require 'pry'

class Owner

  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {fishes: [], cats:[], dogs:[]}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    return "I am a #{self.species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    self.pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    self.pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def reset_pets
    self.pets = {fishes: [], cats:[], dogs:[]}
  end

  def sell_pets
    self.pets.each do |k, v|
      v.each do |animal|
        animal.mood = "nervous"
      end
    end
    self.reset_pets
  end

  def list_pets
    fish_count = self.pets[:fishes].count
    cats_count = self.pets[:cats].count
    dog_count = self.pets[:dogs].count

    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cats_count} cat(s)."

  end

end