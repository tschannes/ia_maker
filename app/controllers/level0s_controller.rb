class Level0sController < GenericController

	def index
		@project = Project.first
		@quicklinks = Quicklink.all
		super
	end


	protected

	def collection
		collection = Level0
	end

end
