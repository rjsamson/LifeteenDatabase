class AddYouthGroupLeaderToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :youth_group_leader, :string
  end
end
