class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :mark
      t.integer :game_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
