class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :links_url
      t.references :type
      t.references :region
      t.timestamps
    end
     add_index :links, :type_id
    add_index :links, :region_id
  end
end

