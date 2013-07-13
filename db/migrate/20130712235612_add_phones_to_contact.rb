class AddPhonesToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :phone, :string
    add_column :contacts, :cell, :string
    add_column :contacts, :fax, :string
    add_column :contacts, :work_phone, :string
  end
end
