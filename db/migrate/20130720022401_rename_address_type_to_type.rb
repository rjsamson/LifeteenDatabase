class RenameAddressTypeToType < ActiveRecord::Migration
  def change
  	rename_column :addresses, :address_type, :type
  end
end
