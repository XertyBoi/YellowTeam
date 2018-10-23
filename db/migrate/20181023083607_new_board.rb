class NewBoard < ActiveRecord::Migration[5.2]
  def change
    change_table :boards do |t|
      t.remove_column :position_id
    end
  end
end
