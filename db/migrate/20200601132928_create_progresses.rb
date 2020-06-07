class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses do |t|
      t.string :chara_icon
      t.string :chara_name
      t.string :work_name
      t.string :work_status
      t.string :update_date
      t.string :job

      t.timestamps
    end
  end
end
