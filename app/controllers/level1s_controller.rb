class Level1sController < ApplicationController

	def show
		@level1s = Level1.all
	end

	def show
		@item = Level1.find(params[:id])
	end

	def new
		
		level0 = Level0.find(params[:first_id])
		@level1 = level0.level1s.build

	end

	def create
		level0 = Level0.find(params[:first_id])
		@level1 = level0.level1s.build(level_params)
		if @level1.save
			flash[:notice] = "Successfully added stuff"
			redirect_to root_path
		else
			render :action => :new, notice: "Something did not work as planned."
		end
	end

	private
	def level_params
		params.require(:level1).permit(:title, :overview, :description)
	end

end


