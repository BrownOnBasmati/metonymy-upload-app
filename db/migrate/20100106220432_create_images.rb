class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :content_type
      t.string :file_name
      t.integer :file_size

      t.timestamps
    end

    add_index :images, :id, {:name => "images_id_index"}
  end

  def self.down
    drop_table :images
  end
end
