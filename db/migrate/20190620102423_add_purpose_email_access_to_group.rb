class AddPurposeEmailAccessToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :purpose, :string
    add_column :groups, :email, :string
    add_column :groups, :access_type, :boolean
  end
end
