class AddMsTwToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :myspace_id, :string
    add_column :contacts, :twitter_id, :string
  end
end
