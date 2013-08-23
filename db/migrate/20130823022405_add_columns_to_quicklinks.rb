class AddColumnsToQuicklinks < ActiveRecord::Migration
  def change
  	add_column :quicklinks, :link_title, :string
  	add_column :quicklinks, :link_subtitle, :string
  	add_column :quicklinks, :link_description, :text
  end

end
