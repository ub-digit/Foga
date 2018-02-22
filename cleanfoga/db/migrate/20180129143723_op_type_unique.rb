class OpTypeUnique < ActiveRecord::Migration[5.1]
  def change

  	#change_column_null(:operations, :operation_type, false)

  	change_table :operations do |t|
  		t.index :operation_type, unique: true
  	end
  end
end
