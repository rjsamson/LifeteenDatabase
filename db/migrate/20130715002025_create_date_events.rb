class CreateDateEvents < ActiveRecord::Migration
  def change
    create_table :date_events do |t|
      t.date :event_date
      t.integer :date_event_type

      t.timestamps
    end
  end
end
