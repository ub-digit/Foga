class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.string :operation_type, :null => false
      t.string :description

      t.timestamps
    end
  end
end
