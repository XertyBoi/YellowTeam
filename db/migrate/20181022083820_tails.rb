class Tails < ActiveRecord::Migration[5.2]
  def change
    change_table :tiles do |t|
      t.integer :link_id
    end
  end
end
