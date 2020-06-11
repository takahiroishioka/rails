class Addmembercharaid < ActiveRecord::Migration[5.2]
  def change
              add_column :members, :chara_id, :integer
  end
end
