class GameVersionPackageVersion < ApplicationRecord
  belongs_to :game_version
  belongs_to :package_version
end
