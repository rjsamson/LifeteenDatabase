class AddImageIdToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :image_id, :integer
  end
end
