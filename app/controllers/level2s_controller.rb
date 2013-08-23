class Level2sController < GenericController

	def collection
		collection = Level0.find(params[:first_id]).level1s.find(params[:second_id]).level2s
	end

end
