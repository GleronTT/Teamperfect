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
    @network = Hash.new []
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
    network[panda1] << panda2
    network[panda2] << panda1
  end

  def are_friends(panda1, panda2)
    network[panda1].include?(panda2) and network[panda2].include?(panda1)
  end

  def friends_of(panda)
    return false unless has_panda(panda)
    result = []
    @network[panda].each { |friend| result << friend }
    result
  end

  def bfs(start, panda)
    queue = Queue.new
    visited = []

    queue << [0, start]
    visited << start

    until queue.empty?

      level, current = queue.pop
      return level if panda == current

      un = network[current].select {|v| !visited.member? v}
      un.each do |v|
        visited << v
        queue << [level+1, v]
      end
    end
    -1
  end

  def connection_level(panda1, panda2)
    bfs(panda1, panda2)
  end

  def are_connected(panda1, panda2)
    return false if connection_level(panda1, panda2) == -1
    true
  end

  def how_many_gender_in_network(start_level, panda, gender)
    queue = Queue.new
    visited = []
    count_gender = 0

    queue << [0, panda]
    visited << panda

    until queue.empty?

      level, current = queue.pop
      count_gender += 1 if start_level == level and current.gender == gender

      un = network[current].select {|v| !visited.member? v}
      un.each do |v|
        visited << v
        queue << [level+1, v]
      end
    end
    count_gender
  end

  def save(file_name)
    File.open(file_name + ".txt", 'w') do |file|
      file.puts network
    end
  end
end

network = PandaSocialNetwork.new
ivo = Panda.new("Ivo", "ivo@pandamail.com", "male")
ivo2 = Panda.new("Ivo", "ivo2@pandamail.com", "male")
rado = Panda.new("Rado", "rado@pandamail.com", "male")
tony = Panda.new("Tony", "tony@pandamail.com", "female")

network.add_panda(ivo)
network.add_panda(rado)
network.add_panda(tony)
network.add_panda(ivo2)

network.make_friends(ivo, rado)
network.make_friends(ivo, tony)

p "Connection level"
p network.connection_level(ivo, ivo2)

p "Are connected"
p network.are_connected(ivo, ivo2)
p network.are_connected(rado, tony)
p ivo.gender
p network.how_many_gender_in_network(0, ivo, "male")

network.save("panda")
