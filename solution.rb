class Panda
  attr_accessor :name, :email, :gender

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

network = PandaSocialNetwork.new
ivo = Panda.new("Ivo", "ivo@pandamail.com", "male")
ivo2 = Panda.new("Ivo", "ivo@pandamail.com", "male")
rado = Panda.new("Rado", "rado@pandamail.com", "male")
tony = Panda.new("Tony", "tony@pandamail.com", "female")

network.add_panda(ivo)
network.add_panda(rado)
network.add_panda(tony)
#network.add_panda(ivo2)

p ivo.name == "Ivo"
p ivo.equal? ivo2
p ivo.hash
p ivo2.hash

network.make_friends(ivo, rado)
network.make_friends(ivo, tony)
p network.are_friends(ivo, rado)

