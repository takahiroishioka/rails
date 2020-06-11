class AddStaff < ActiveRecord::Migration[5.2]
  def change
      add_column :staffs, :section_id, :integer
  end
end
