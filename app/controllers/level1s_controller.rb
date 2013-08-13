class Level1sController < ApplicationController

	def show
		@item = Level1.all
	end

	def show
		@item = Level1.find(params[:id])
	end

	def new
		
		level0 = Level0.find(params[:first_id])
		@item = level0.level1s.build

	end

	def edit
		@item = Level0.find(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @item }
		end
	end

	def update
		@item = Level0.find(params[:id])
		respond_to do |format|
			if @item.update_attributes(level_params)
				format.html { redirect_to root_path,
				notice: 'item was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @item.errors,
				status: :unprocessable_entity }
			end
		end
	end

	def create
		level0 = Level0.find(params[:first_id])
		@item = level0.level1s.build(level_params)
		if @item.save
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


