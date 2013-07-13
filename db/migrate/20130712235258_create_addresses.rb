class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :street
      t.string :zipcode

      t.timestamps
    end
  end
end
