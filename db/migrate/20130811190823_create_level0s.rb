class CreateLevel0s < ActiveRecord::Migration
  def change
    create_table :level0s do |t|
      t.string :title
      t.string :overview
      t.string :description
      t.timestamps
    end
  end
end
