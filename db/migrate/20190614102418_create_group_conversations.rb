class CreateGroupConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :group_conversations do |t|
      t.text :message
      t.string :image
      t.string :file
      t.integer :receiver_id
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
