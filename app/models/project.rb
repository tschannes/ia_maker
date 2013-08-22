class Project < ActiveRecord::Base
	validates :project_title, :project_subtitle, presence: true
end
