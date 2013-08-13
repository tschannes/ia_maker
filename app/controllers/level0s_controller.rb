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
		@item = Level0.new
		@level1 = @item.level1s.build
		@level2 = @level1.level2s.build
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

	def destroy
		@item = Level0.find(params[:id])
		@subs = @item.level1s
		@subs.destroy if @subs
		@item.destroy
		flash[:alert] = "The item was deleted."
		redirect_to root_path

		respond_to do |format|
			format.html { root_path }
			format.xml  { head :ok }
		end
	end

	private
	def level_params
		params.require(:level0).permit(:title, :overview, :description)
	end

end
