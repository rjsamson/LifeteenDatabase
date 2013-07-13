class AddAddressesToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :address1_id, :integer
    add_column :contacts, :address2_id, :integer
    add_column :contacts, :college_address_id, :integer
  end
end
