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
		@level0 = Level0.new
	end


	def create
		@level0 = Level0.new(level0_params)
		if @level0.save
			redirect_to root_path, notice: "Item added."
		else
			render :action => :new, notice: "Something did not work as planned."
		end
	end

	private
	def level0_params
		params.require(:level0).permit(:title, :overview, :description)
	end

end
