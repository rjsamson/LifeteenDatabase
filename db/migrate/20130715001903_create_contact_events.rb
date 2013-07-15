class CreateContactEvents < ActiveRecord::Migration
  def change
    create_table :contact_events do |t|
      t.integer :event_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
