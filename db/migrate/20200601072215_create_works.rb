class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :work_name
      t.string :work_status
      t.string :work_ico
      t.string :work_top_image

      t.timestamps
    end
  end
end
