class CreateUserThreads < ActiveRecord::Migration[5.2]
  def change
    create_table :user_threads do |t|
      t.text :thread_message
      t.integer :receiver_id
      t.belongs_to :user_conversation, foreign_key: true

      t.timestamps
    end
  end
end
