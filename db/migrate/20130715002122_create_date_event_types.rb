class CreateDateEventTypes < ActiveRecord::Migration
  def change
    create_table :date_event_types do |t|
      t.string :value

      t.timestamps
    end
  end
end
