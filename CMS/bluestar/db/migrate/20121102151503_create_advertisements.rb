class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :image
      t.string :filename
      t.references :event_id

      t.timestamps
    end
    add_index :advertisements, :event_id_id
  end
end
