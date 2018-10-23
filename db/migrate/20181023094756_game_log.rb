class GameLog < ActiveRecord::Migration[5.2]
  def change
    change_table :games do |t|
      t.string :log
    end
  end
end
