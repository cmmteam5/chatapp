class AddLevelToUserworkspace < ActiveRecord::Migration[5.2]
  def change
    add_column :userworkspaces, :level, :string
  end
end
