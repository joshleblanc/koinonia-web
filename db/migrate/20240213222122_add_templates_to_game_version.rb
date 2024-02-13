class AddTemplatesToGameVersion < ActiveRecord::Migration[7.1]
  def change
    add_column :game_versions, :templates, :json
  end
end
