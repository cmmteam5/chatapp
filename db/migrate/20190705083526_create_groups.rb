class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :purpose
      t.boolean :access_type
      t.belongs_to :workspace, foreign_key: true

      t.timestamps
    end
  end
end
