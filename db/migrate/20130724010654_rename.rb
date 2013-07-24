class Rename < ActiveRecord::Migration
  def change
  	rename_column :date_events, :date_event_type, :date_event_type_id
  end
end
