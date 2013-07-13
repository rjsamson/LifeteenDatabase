class AddMoreColumnsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :facebook_id, :string
    add_column :contacts, :first_communion, :date
    add_column :contacts, :first_reconciliation, :date
    add_column :contacts, :gender, :string
    add_column :contacts, :graduating_class, :string
    add_column :contacts, :is_active, :boolean
    add_column :contacts, :is_group_or_parish, :boolean
    add_column :contacts, :life_experience, :text
  end
end
