class Level0sController < ApplicationController

	def index
		@level0 = Level0.all
	end
end
