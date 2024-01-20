class AddPublishedFlagToGameVersion < ActiveRecord::Migration[7.1]
  def change
    add_column :game_versions, :published_at, :datetime, default: nil
    add_column :game_versions, :published, :boolean, default: false
  end
end
