class Level2sController < ApplicationController

	def show
		@level2s = Level2.all
	end

	def show
		@item = Level2.find(params[:id])
	end

	def new

		level1 = Level1.find(params[:second_id])
		@level2 = level1.level2s.build

	end

	def create
		level1 = Level1.find(params[:second_id])
		@level2 = level1.level2s.build(level_params)
		if @level2.save
			flash[:notice] = "Successfully added stuff"
			redirect_to root_path
		else
			render :action => :new, notice: "Something did not work as planned."
		end
	end

	private
	def level_params
		params.require(:level2).permit(:title, :overview, :description)
	end


end
