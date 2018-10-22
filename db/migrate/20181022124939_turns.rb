class Turns < ActiveRecord::Migration[5.2]
  def change
    change_table :games do |t|
      t.integer :turn_id
    end
  end
end
