class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :total_win
      t.integer :points

      t.timestamps
    end
  end
end
