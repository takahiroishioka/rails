class CharaChange < ActiveRecord::Migration[5.2]
  def change
        add_column :charas, :work_id, :integer
  end
end
