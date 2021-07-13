class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :album_art
      t.string :name
      t.references :user

      t.timestamps
    end
  end
end
