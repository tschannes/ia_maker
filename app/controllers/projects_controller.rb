class ProjectsController < ApplicationController

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
		respond_to do |format|
			if @project.update_attributes(project_params)
				format.html { redirect_to ia_path,
				notice: 'Project was successfully updated.' }
			else
				format.html { render action: "edit" }
			end
		end
	end

	def show
		@project = Project.first
	end

	private

	def project_params
		params.require(:project).permit(:project_title, :project_subtitle)
	end
end
