class Panda
	attr_accessor :name, :email, :gender 


    def intialize(name ,email , gender)
    	@name , @email, @gander = name , email , gender 
    end
    def ==	
   def to_s
     "Name: #{name}, email: #{email}, gander: #{gender}"    
   end
   

   def male?
     gander == "male"
   end
   def female?
     gander == "famale"
   end

    def hash
		to_s.hash
	end
	alias_method :eql? , :==
    end
	
	def equal?(other)
		name == other.name && email == other.email && gender == other.gender 
	end
end

class PandaSocialNetwork
    def initialize(network = [] , friends = {} )
        @network , @friends = network , friends
    end
    def add_panda(panda)
    	network[panda] = []
    end
    def has_panda(panda)
    	if network.has_key?(panda)
    		return true
    	else 
    		return false 
    	end
    end
    def are_friends(panda1, panda2)
      if panda1.include(panda2)
       	return true
      else 
       	return false
      end
    end
    def make_friends(panda1 , panda2)
     
    end

    def friends_of(panda)
      return false unless has_panda
    end
    def connection_level(panda1, panda2)
     
    end
end






network = PandaSocialNetwork.new
ivo = Panda.new("Ivo", "ivo@pandamail.com", "male")
rado = Panda.new("Rado", "rado@pandamail.com", "male")
tony = Panda.new("Tony", "tony@pandamail.com", "female")

network.add_panda(ivo)
network.add_panda(rado)
network.add_panda(tony)

p ivo.name = "Ivo" 