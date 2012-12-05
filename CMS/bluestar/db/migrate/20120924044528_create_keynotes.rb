class CreateKeynotes < ActiveRecord::Migration
  def change
    create_table :keynotes do |t|
      t.string :name
      t.binary :pdf
      t.string :filename
      t.string :content_type
      t.references :event

      t.timestamps
    end
    add_index :keynotes, :event_id
  end
end
