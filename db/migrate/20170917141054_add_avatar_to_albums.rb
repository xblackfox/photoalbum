class AddAvatarToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :avatar, :string
  end
end
