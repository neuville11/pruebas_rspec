class Animal < ActiveRecord::Base
	def legs
		{pig: 4, chicken: 2, octopus: 8}[specie.to_sym]			
	end
end