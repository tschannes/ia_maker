class AddDefaultToProject < ActiveRecord::Migration
  def up
    # Set default value
    change_column_default(:projects, :project_title, "Project Title")
    change_column_default(:projects, :project_subtitle, "Subtitle")
  end

  def down
    # Remove default
    change_column_default(:projects, :project_title, nil)
    change_column_default(:projects, :project_subtitle, nil)
  end
end
