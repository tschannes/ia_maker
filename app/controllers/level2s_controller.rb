class Level2sController < ApplicationController

	def show
		@level2s = Level2.all
	end

	def show
		@item = Level2.find(params[:id])
	end

end
