class QuicklinksController < ApplicationController

	respond_to :html, :json

	def new
		@quicklink = Quicklink.new
	end

	def create
		@quicklink = Quicklink.new(link_params)
		if @quicklink.save
			flash[:notice] = "Successfully added stuff"
			redirect_to ia_path
		else
			render :action => :new, notice: "Something did not work as planned."
		end
	end

	def edit
		@quicklink = Quicklink.find(params[:id])
	end

	def update
		@quicklink = Quicklink.find(params[:id])
		if @quicklink.update_attributes(link_params)
			redirect_to ia_path,
			notice: 'Quicklink-Header was successfully updated.' 
		else
			render action: "edit"
		end
	end

	def show
		@quicklinks = Quicklink.all
		quicklink = Quicklink.find(params[:id])
		@items = Array(quicklink)
	end

	def destroy
		quicklink = Quicklink.find(params[:id])
		quicklink.destroy
		flash[:warning] = "Successfully deleted" + quicklink.title
		redirect_to ia_path
	end


	protected

	def link_params
		params.require(:quicklink).permit(:title, :subtitle, :description)
	end

end
