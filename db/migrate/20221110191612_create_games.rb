class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :player_id, foreign_key: true
      t.timestamps
    end
  end
end
