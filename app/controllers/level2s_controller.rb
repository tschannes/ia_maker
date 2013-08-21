class Level2sController < ApplicationController

	def index
		@items = Level2.all
	end

	def show
		item = Level1.find(params[:id])
		@items = Array(item)
	end

	def new
		level1 = Level1.find(params[:second_id])
		@item = level1.level2s.build
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

	def edit
		@item = Level0.find(params[:first_id]).level1s.find(params[:second_id]).level2s.find(params[:id])
		
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @item }
		end
	end

	def update
		@item = Level0.find(params[:first_id]).level1s
		.find(params[:second_id]).level2s.find(params[:id])
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

	def destroy
		@item = Level0.find(params[:first_id]).level1s
		.find(params[:second_id]).level2s.find(params[:id])
		@item.destroy
		flash[:alert] = "The item was deleted."
		redirect_to root_path
	end

	private
	def level_params
		params.require(:level2).permit(:title, :overview, :description)
	end


end
