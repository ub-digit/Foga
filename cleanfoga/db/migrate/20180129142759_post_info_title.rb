class PostInfoTitle < ActiveRecord::Migration[5.1]
  def change

  	#change_column_null(:post_infos, :title, false)

  	change_table :post_infos do |t|
  		t.index :title, unique: true
  	end
  end
end
