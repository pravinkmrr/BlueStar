class AddPdfColumnToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :pdf, :string
  end
end
