class CreateUserConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_conversations do |t|
      t.text :message
      t.string :image
      t.string :file
      t.integer :receiver_id
      t.string :starred_message
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
