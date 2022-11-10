class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :grids, array: true, default: Array.new(3) { Array.new(3, "_") }
      t.integer :game_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
