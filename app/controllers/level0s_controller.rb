class Level0sController < GenericController

	def index
		@project = Project.first
		super
	end

end
