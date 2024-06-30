class AddFlagsToConversations < ActiveRecord::Migration[7.1]
  def change
    add_column :conversations, :send_documentation, :boolean, default: true
    add_column :conversations, :send_baseline_prompt, :boolean, default: true
    add_column :conversations, :send_project_code, :boolean, default: true
  end
end
