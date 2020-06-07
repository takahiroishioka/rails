class CreateCharas < ActiveRecord::Migration[5.2]
  def change
    create_table :charas do |t|
      t.string :chara_name
      t.string :chara_icon
      t.integer :cast_id
      t.string :tag1
      t.string :tag2
      t.string :tag3
      t.string :tag4

      t.timestamps
    end
  end
end
