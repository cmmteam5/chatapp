class CreateGroupThreads < ActiveRecord::Migration[5.2]
  def change
    create_table :group_threads do |t|
      t.text :thread_message
      t.integer :receiver_id
      t.belongs_to :group_conversation, foreign_key: true

      t.timestamps
    end
  end
end
