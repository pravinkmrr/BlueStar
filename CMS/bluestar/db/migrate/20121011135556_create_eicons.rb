class CreateEicons < ActiveRecord::Migration
  def change
    create_table :eicons do |t|
      t.string :icon
      t.string :icon_file
      t.string :icon_name

      t.timestamps
    end
  end
end
