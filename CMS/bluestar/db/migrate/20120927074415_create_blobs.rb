class CreateBlobs < ActiveRecord::Migration
  def change
    create_table :blobs do |t|
      t.binary :file
      t.string :filename
      t.string :content_type

      t.timestamps
    end
  end
end
