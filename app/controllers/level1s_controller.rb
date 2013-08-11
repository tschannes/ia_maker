class Level1sController < ApplicationController

	def show
		@level1s = Level1.all
	end

	def show
		@item = Level1.find(params[:id])
	end

end
