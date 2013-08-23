class QuicklinksController < ApplicationController

	respond_to :html, :json

	def new
		@quicklink = Quicklink.new
	end

	def create
		@quicklink = Quicklink.new(quicklink_params)
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
			notice: 'quicklink-Header was successfully updated.' 
		else
			render action: "edit"
		end
	end

	def index
		unless @quicklinks.nil?
			@quicklinks = Quicklink.all
			render 'level0s'
		end
	end

	def destroy
		
	end


	protected

	def link_params
		require(:quicklinks).permit(:link_title, :link_subtitle, :link_description)
	end

end
