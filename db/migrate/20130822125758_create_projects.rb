class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_title
      t.string :project_subtitle
      t.timestamps
    end
  end
end
