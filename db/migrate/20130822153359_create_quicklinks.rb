class CreateQuicklinks < ActiveRecord::Migration
  def change
    create_table :quicklinks do |t|

      t.timestamps
    end
  end
end
