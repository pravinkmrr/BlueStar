class AddLogotoEvents < ActiveRecord::Migration
  def change
    add_column :events, :right_file, :string
    add_column :events, :right_filename, :string
  end
end