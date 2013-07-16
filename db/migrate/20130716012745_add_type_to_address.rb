class AddTypeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :type, :string
    add_column :addresses, :contact_id, :integer
  end
end
