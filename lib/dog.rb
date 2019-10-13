require_relative 'animals'

class Dog < Animal

  def initialize(name, owner)
    super
    owner.dogs << self
  end
end
