class AddTestColumnToWorkspace < ActiveRecord::Migration[5.2]
  def change
    add_column :workspaces, :admin, :boolean, default:true
  
  end
end
