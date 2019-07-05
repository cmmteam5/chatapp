class RemoveEmailFromGroup < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :email, :string
  end
end
