class CreateHelpInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :help_infos do |t|
      t.text :helptext
      t.string :updated_by

      t.timestamps
    end
  end
end
