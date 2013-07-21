class RenameTypeToAddressType < ActiveRecord::Migration
  def change
  	rename_column :addresses, :type, :address_type
  end
end
