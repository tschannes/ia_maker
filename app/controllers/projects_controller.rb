class ProjectsController < ApplicationController

	respond_to :html, :json

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:notice] = "Successfully added stuff"
			redirect_to ia_path
		else
			render :action => :new, notice: "Something did not work as planned."
		end
	
	end

	def edit
		@project = Project.first
	end

	def update
		@project = Project.first
		if @project.update_attributes(project_params)
			redirect_to ia_path,
			notice: 'Project-Header was successfully updated.' 
		else
			render action: "edit"
		end
	end

	def show
		@project = Project.first
		render 'level0s'
	end

	private

	def project_params
		params.require(:project).permit(:project_title, :project_subtitle)
	end
end
