class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio

      t.timestamps
    end

    add_index :artists, :first_name, {:name => "artists_first_name_index"}
    add_index :artists, :last_name, {:name => "artists_last_name_index"}
  end

  def self.down
    drop_table :artists
  end
end
