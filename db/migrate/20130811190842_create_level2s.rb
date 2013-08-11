class CreateLevel2s < ActiveRecord::Migration
  def change
    create_table :level2s do |t|
      t.string :title
      t.string :overview
      t.string :description
      t.integer :level1_id
      t.timestamps
    end
  end
end
