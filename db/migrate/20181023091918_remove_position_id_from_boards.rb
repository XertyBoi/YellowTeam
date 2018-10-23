class RemovePositionIdFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :position_id
  end
end
