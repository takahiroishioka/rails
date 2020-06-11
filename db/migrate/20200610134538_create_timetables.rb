class CreateTimetables < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables do |t|
      t.string :title
      t.datetime :deadline
      t.integer :work_id
      t.integer :section_id

      t.timestamps
    end
  end
end
