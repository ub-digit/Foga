class AddShowToPostInfos < ActiveRecord::Migration[5.1]
  def change
    add_column :post_infos, :show, :boolean, default: true
  end
end
