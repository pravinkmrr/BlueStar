class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.binary :pdf
      t.string :filename
      t.string :content_type
      t.references :event

      t.timestamps
    end
    add_index :maps, :event_id
  end
end
