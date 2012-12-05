class CreateCalenders < ActiveRecord::Migration
  def change
    create_table :calenders do |t|
      t.string :title
      t.text :message
      t.time :time
      t.date :date
      t.references :event

      t.timestamps
    end
    add_index :calenders, :event_id
  end
end
