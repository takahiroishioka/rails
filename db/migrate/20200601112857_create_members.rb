class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :work_id
      t.string :job

      t.timestamps
    end
  end
end
