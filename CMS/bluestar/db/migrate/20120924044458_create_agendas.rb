class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :name
      t.binary :pdf
      t.string :filename
      t.string :content_type
      t.references :event

      t.timestamps
    end
    add_index :agendas, :event_id
  end
end
