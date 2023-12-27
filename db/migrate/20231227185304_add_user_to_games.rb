class AddUserToGames < ActiveRecord::Migration[7.1]
  def change
    GameVersion.delete_all
    Game.delete_all
    add_reference :games, :user, null: false, foreign_key: true
  end
end
