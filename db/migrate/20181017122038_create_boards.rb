class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :game_id
      t.integer :position_id
    end
  end
end
