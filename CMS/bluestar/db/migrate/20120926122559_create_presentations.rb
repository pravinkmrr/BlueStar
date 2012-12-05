class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name
      t.string :filename
      t.references :workshop
      t.references :event

      t.timestamps
    end
    add_index :presentations, :workshop_id
    add_index :presentations, :event_id
  end
end
