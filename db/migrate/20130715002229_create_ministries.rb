class CreateMinistries < ActiveRecord::Migration
  def change
    create_table :ministries do |t|
      t.string :value

      t.timestamps
    end
  end
end
