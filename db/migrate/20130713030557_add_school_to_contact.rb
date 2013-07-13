class AddSchoolToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :school, :string
  end
end
