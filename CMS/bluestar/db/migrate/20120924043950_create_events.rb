class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.binary :logo
      t.string :filename
      t.string :content_type

      t.timestamps
    end
  end
end
