class CreateGroupthreads < ActiveRecord::Migration[5.2]
  def change
    create_table :groupthreads do |t|
      t.text :thread_message
      t.belongs_to :groupconversation, foreign_key: true

      t.timestamps
    end
  end
end
