class Addtoevents < ActiveRecord::Migration
  def change 
  	add_column :events, :region_id, :integer ,:references=>"regions"
  end

end