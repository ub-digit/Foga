class CreatePostInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :post_infos do |t|
      t.string :title, :null => false
      t.string :issn
      t.string :created_by, :null => false
      t.string :updated_by, :null => false
      t.string :publisher
      t.text :comment

      t.integer :operation_id

      t.timestamps
    end
  end
end
