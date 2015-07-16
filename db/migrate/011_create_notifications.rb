class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :id_suivi
      t.string :ref_suivi
	  t.string :project
      t.string :old_status
      t.string :new_status
      t.string :role
      t.date :dt_notification
    end
  end
end
