class AddColumnsToQuicklinks < ActiveRecord::Migration
  def change
  	add_column :quicklinks, :title, :string
  	add_column :quicklinks, :overview, :string
  	add_column :quicklinks, :description, :text
  end

end
