class CreateLevel1s < ActiveRecord::Migration
  def change
    create_table :level1s do |t|
      t.string :title
      t.string :overview
      t.string :description
      t.integer :level0_id
      t.timestamps
    end
  end
end
