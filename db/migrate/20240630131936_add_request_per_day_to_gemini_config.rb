class AddRequestPerDayToGeminiConfig < ActiveRecord::Migration[7.1]
  def change
    add_column :gemini_configs, :requests_per_day, :integer, default: 1500
  end
end
