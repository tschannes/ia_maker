class Level1sController < Level0sController

	def collection
		collection = Level0.find(params[:first_id]).level1s
	end

end


