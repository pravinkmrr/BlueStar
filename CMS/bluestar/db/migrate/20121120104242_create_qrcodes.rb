class CreateQrcodes < ActiveRecord::Migration
  def change
    create_table :qrcodes do |t|
      t.string :link
      t.string :app_name
      t.string :device

      t.timestamps
    end
  end
end
