class ChangeTask2 < ActiveRecord::Migration[5.2]
  def change
          add_column :tasks, :work_name, :string
          add_column :tasks, :chara_name, :string
  end
end
