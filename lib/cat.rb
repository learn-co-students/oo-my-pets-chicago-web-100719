require_relative 'animals'

class Cat < Animal
  def initialize(name, owner)
    super
    owner.cats << self
  end

end
