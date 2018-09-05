class NonUniqueTitle < ActiveRecord::Migration[5.1]
  def change
      change_table :post_infos do |t|
      t.index :title, unique: false
   end
  end
end
