class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :title
      t.text :message
      t.date :date
      t.time :time
      t.references :event

      t.timestamps
    end
  end
end
