class RemoveAddressesFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :address1_id, :string
    remove_column :contacts, :address2_id, :string
    remove_column :contacts, :college_address_id, :string
  end
end
