class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :icon_name
      t.string :icon_file
      t.string :icon

      t.timestamps
    end
  end
end