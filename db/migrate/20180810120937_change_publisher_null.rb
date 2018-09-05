class ChangePublisherNull < ActiveRecord::Migration[5.1]
  
  def change
   change_column_null :post_infos, :publisher, false
  end
end
