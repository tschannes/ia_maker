class Level0sController < ApplicationController

	before_filter :require_login, :except => :start

	def index
		@project = Project.first
		@quicklinks = Quicklink.all
		# @items = collection.all
		# export
		@items = Level0.all.sort_by(&:created_at)
		respond_to do |format|
			format.html
			format.json { render :json => @items }
		end
	end

	def show
		item = collection.find(params[:id])
		@items = Array(item)
	end

	def new
		@item = collection.new
	end

	def edit
		@item = collection.find(params[:id])
	end

	def update
		@item = collection.find(params[:id])
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
		@item = collection.new(level_params)
		if @item.save
			flash[:notice] = "Successfully added stuff"
			redirect_to ia_path
		else
			render :action => :new, notice: "Something did not work as planned."
		end
	end

	def destroy
		item = collection.find(params[:id])
		if item.respond_to?("send(get_children")
			@subs = item.send(get_children)
			@subs.destroy
		end
		item.destroy
		flash[:alert] = "The item was deleted."
		redirect_to ia_path
	end

	protected

	def level_params
		params.require(controller_name.singularize.to_sym).permit(:title, :overview, :description)
	end

	def instance_variable
		instance_variable = instance_variable_get("@#{controller_name.singularize}")
	end

	def get_children
		string = controller_name.to_s
		num = string.match(/\d/).to_s.to_i
		num += 1 if num < 2
		get_children = "level#{num}s"
	end

	def parent_id
		string = controller_name.to_s
		parent_id = string.to_s + "_id"
		parent_id
	end

	def collection
		collection = Level0
	end

	# def export_json
	# 	@items = Level0.all
	# 	 render :json => @items.to_json(:include => { :level1s => { :include => :level2s }})
	#    # render :json => @items.to_json(:include => { :modelb => { :include => :modelc }})

	# end

end
