class RemoveIndexFromPostInfos < ActiveRecord::Migration[5.1]
  def change
   remove_index :post_infos, :title
  end
end
