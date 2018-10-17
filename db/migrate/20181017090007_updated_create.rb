class UpdatedCreate < ActiveRecord::Migration[5.2]
  def change
    change_table :games do |t|
      t.remove :created_at, :updated_at
    end
  end
end
