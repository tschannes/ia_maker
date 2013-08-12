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
		@level1 = @level0.level1s.build
		@level2 = @level1.level2s.build
	end


	def create
		@level0 = Level0.new(level_params)
		@level0.level1s.map do |x|
			x.level0_id = :first_id
		end
		if @level0.save
			flash[:notice] = "Successfully added stuff"
			redirect_to root_path
		else
			render :action => :new, notice: "Something did not work as planned."
		end
	end

	private
	def level_params
		params.require(:level0).permit(:title, :overview, :description)
	end

end
