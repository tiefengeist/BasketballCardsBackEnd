class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :team_name
      t.string :img
      t.string :position
      t.integer :weight
      t.integer :height
      t.string :logo

      t.timestamps
    end
  end
end
