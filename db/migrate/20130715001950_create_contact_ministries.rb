class CreateContactMinistries < ActiveRecord::Migration
  def change
    create_table :contact_ministries do |t|
      t.integer :ministry_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
