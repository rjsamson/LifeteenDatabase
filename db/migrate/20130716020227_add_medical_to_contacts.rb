class AddMedicalToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :medical, :string
  end
end
