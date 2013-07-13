class AddScvToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :safe_child_video_letter_sent, :boolean
    add_column :contacts, :watched_safe_child_video, :boolean
  end
end
