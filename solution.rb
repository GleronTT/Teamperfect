class Panda
  attr_acecssor :name, :email, :gender

  def initialize(name, email, gender)
    @name, @email, @gender = name, email, gender
  end

  def to_s
    "Name: #{name}, email: #{email}, gender: #{gender}"
  end

  def male?
    gender == "male"
  end

  def female?
    gender == "female"
  end

  def equal?(other)
    name == other.name &&
    email == other.email &&
    gender == other.gender
  end

  def == (other)
    to_s == other.to_s
  end

  def hash
    to_s.hash
  end

  alias_method :eql?, :==
end

class PandaSocialNetwork
  attr_reader :network

  def initialize
    @network = {}
  end

  def add_panda(panda)
    if has_panda(panda)
      raise "PandaAlreadyThere"
    else
      network[panda] = []
    end
  end

  def has_panda(panda)
    if network.has_key?(panda)
      return true
    else
      return false
    end
  end

  def make_friends(panda1, panda2)
    network[panda1] << panda2.name
    network[panda2] << panda1.name
  end

  def are_friends(panda1, panda2)
    network[panda1].include?(panda2.name) and network[panda2].include?(panda1.name)
  end
end


