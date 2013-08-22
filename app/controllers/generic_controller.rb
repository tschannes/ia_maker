class GenericController < ApplicationController
	# def show
	# 	instance_variable = instance_variable_get("@#{controller_name.singularize}")

	# 	@items = Array(instance_variable)
	# end

	def index
		@items = get_objects.all
		respond_to do |format|
			format.html { ia_path }
			format.json { render :json => @items }
			format.xml { render :xml => @items }
		end
	end

	def show
		item = get_objects.find(params[:id])
		@items = Array(item)
	end

	def new
		@item = get_objects.new
	end

	def edit
		@item = get_objects.find(params[:id])
	end

	def update
		@item = get_objects.find(params[:id])
		respond_to do |format|
			if @item.update_attributes(level_params)
				format.html { redirect_to ia_path,
				notice: 'item was successfully updated.' }
			else
				format.html { render action: "edit" }
			end
		end
	end

	def create
		instance_variable = get_objects.new(level_params)
		instance_variable.send(get_children).map do |x|
			x.level0_id = :first_id
		end
		if instance_variable.save
			flash[:notice] = "Successfully added stuff"
			redirect_to ia_path
		else
			render :action => :new, notice: "Something did not work as planned."
		end
	end

	def destroy
		@item = get_objects.find(params[:id])
		@subs = @item.send(get_children)
		@subs.destroy if @subs
		@item.destroy
		flash[:alert] = "The item was deleted."
		redirect_to ia_path
	end

	private

	def level_params
		params.require(controller_name.singularize.to_sym).permit(:title, :overview, :description)
	end

	def get_objects
		controller_name.singularize.capitalize.constantize
	end

	def instance_variable
		instance_variable = instance_variable_get("@#{controller_name.singularize}")
	end

	def get_children
		string = controller_name.to_s
		num = string.match(/\d/).to_s.to_i
		num += 1
# check this
		get_children = "level#{num}s" 
	end
end