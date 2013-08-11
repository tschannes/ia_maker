class Level0sController < ApplicationController

	def index
		@level0s = Level0.all
		@level1s = Level1.all
		@level2s = Level2.all
	end

	def show
		@item = Level0.find(params[:id])
	end

	def new
		@item = Level0.new(params[:level0])
	end

	def create
		params.permit!
		@level0 = Level0.new(params[:level0])
		
	end

end
