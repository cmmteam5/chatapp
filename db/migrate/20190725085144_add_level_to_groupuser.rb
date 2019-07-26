class AddLevelToGroupuser < ActiveRecord::Migration[5.2]
  def change
    add_column :groupusers, :level, :string
  end
end
