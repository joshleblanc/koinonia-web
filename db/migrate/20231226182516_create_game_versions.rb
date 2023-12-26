class CreateGameVersions < ActiveRecord::Migration[7.1]
  def change
    create_table :game_versions do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.json :scripts
      t.json :level

      t.timestamps
    end
  end
end
