class AddLatestForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_reference :packages, :latest_package_version, index: true, foreign_key: { to_table: :package_versions }
    add_reference :packages, :latest_published_package_version, index: true, foreign_key: { to_table: :package_versions}
    add_reference :games, :latest_game_version, index: true, foreign_key: { to_table: :game_versions}    
    add_reference :games, :latest_published_game_version, index: true, foreign_key: { to_table: :game_versions}

    Game.find_each(&:save)
    Package.find_each(&:save)
  end
end
