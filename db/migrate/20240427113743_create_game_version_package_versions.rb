class CreateGameVersionPackageVersions < ActiveRecord::Migration[7.1]
  def change
    create_table :game_version_package_versions do |t|
      t.belongs_to :game_version, null: false, foreign_key: true
      t.belongs_to :package_version, null: false, foreign_key: true

      t.timestamps
    end
  end
end
