class CreateContactDateEvents < ActiveRecord::Migration
  def change
    create_table :contact_date_events do |t|
      t.integer :date_event_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
