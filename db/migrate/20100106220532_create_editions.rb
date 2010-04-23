class CreateEditions < ActiveRecord::Migration
  def self.up
    create_table :editions do |t|
      t.integer :artist_id
      t.integer :image_id
      t.string :name

      t.timestamps
    end

    add_index :editions, :artist_id, {:name => "editions_artist_id_index"}
    add_index :editions, :image_id, {:name => "editions_image_id_index"}
  end

  def self.down
    drop_table :editions
  end
end
