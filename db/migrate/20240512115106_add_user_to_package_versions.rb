class AddUserToPackageVersions < ActiveRecord::Migration[7.1]
  def change
    add_reference :package_versions, :user, null: false, foreign_key: true
  end
end
