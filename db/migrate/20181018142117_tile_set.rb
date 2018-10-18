class TileSet < ActiveRecord::Migration[5.2]
  def change
    change_table :boards do |t|
      t.string :tile_set
    end

    create_table :tiles do |t|
      t.string :tile_type
    end
  end
end
