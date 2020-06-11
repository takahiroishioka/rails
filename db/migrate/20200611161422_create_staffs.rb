class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.integer :member_id
      t.string :join
      t.string :boolean

      t.timestamps
    end
  end
end
