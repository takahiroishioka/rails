class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_title
      t.integer :user_id
      t.integer :wrok_id
      t.integer :chara_id
      t.datetime :deadline
      t.string :task_link

      t.timestamps
    end
  end
end
