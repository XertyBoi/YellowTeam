class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :uuid
      t.integer :game_id
      t.string :nickname
      t.integer :position_id
    end
  end
end
