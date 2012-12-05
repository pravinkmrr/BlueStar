class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :region_name

      t.timestamps
    end
  end
end
