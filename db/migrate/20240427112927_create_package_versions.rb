class CreatePackageVersions < ActiveRecord::Migration[7.1]
  def change
    create_table :package_versions do |t|
      t.belongs_to :package, null: false, foreign_key: true
      t.json :levels
      t.json :scripts
      t.json :templates
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
