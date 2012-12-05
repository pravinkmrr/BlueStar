class CreateExhibitors < ActiveRecord::Migration
  def change
    create_table :exhibitors do |t|
      t.string :name
      t.binary :pdf
      t.string :filename
      t.string :content_type
      t.references :event

      t.timestamps
    end
    add_index :exhibitors, :event_id
  end
end
