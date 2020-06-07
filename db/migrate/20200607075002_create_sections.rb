class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :section_name
      t.integer :work_id

      t.timestamps
    end
  end
end
