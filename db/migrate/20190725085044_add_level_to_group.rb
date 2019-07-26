class AddLevelToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :level, :string
  end
end
