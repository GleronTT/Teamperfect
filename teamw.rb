class Panda
	attr_accesor :name, :email, :gander 

    def intialize(name ,email , gander)
    	@name , @email, @gander = name , email , gander 
    end
   def to_s
     "Name: #{name}, email: #{email}, gander: #{gander}"    
   end
   def male?
     gander == "male"
   end
   def female?
     gander == "famale"
   end

   def to_hash
		hash = {}
		self.each do |elem|
			hash[elem[0]] = elem[1]
		end
	end
	
	def equal?(other)
		name == other.name && email == other.email && gender == other.gender 
	end
end

class Panda