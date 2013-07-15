class AddMetaToImage < ActiveRecord::Migration
  def change
    add_column :images, :filename, :string
    add_column :images, :filetype, :string
  end
end
