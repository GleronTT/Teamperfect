class Panda
   def to_s
    
   end

   def to_hash
		hash = {}
		self.each do |elem|
			hash[elem[0]] = elem[1]
		end
		hash
	end

end