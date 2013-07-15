class CreateCatecheticalExperiences < ActiveRecord::Migration
  def change
    create_table :catechetical_experiences do |t|
      t.date :end_date
      t.string :grades
      t.date :start_date
      t.integer :contact_id

      t.timestamps
    end
  end
end
