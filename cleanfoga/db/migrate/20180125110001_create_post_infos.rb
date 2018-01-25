class CreatePostInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :post_infos do |t|
      t.string :title
      t.string :issn
      t.string :created_by
      t.string :updated_by
      t.string :publisher
      t.text :comment

      t.timestamps
    end
  end
end
