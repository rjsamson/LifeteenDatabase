class AddWscvToContact < ActiveRecord::Migration
  def change
  	remove_column :contacts, :watched_safe_child_video
    add_column :contacts, :watched_safe_child_video, :integer
  end
end
