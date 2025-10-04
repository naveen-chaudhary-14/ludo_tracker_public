class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.references :winner, null: false, foreign_key: { to_table: :players }
      t.references :runner_up, null: false, foreign_key: { to_table: :players }
      t.references :second_runner_up, null: false, foreign_key: { to_table: :players }
      t.references :last, null: false, foreign_key: { to_table: :players }
      t.timestamps
    end
  end
end
