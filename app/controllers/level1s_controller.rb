class Level1sController < GenericController

	def collection
		collection = Level0.find(params[:first_id]).level1s
	end

end


