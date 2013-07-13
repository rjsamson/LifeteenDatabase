class AddColumnsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :allergies, :string
    add_column :contacts, :background_check, :date
    add_column :contacts, :baptism, :date
    add_column :contacts, :birthday, :date
    add_column :contacts, :code_of_conduct, :boolean
    add_column :contacts, :college, :string
    add_column :contacts, :college_email, :string
    add_column :contacts, :confirmation, :date
    add_column :contacts, :diet_restrictions, :string
    add_column :contacts, :email, :string
    add_column :contacts, :email2, :string
  end
end
