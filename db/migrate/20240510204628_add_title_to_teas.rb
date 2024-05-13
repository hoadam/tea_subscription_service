class AddTitleToTeas < ActiveRecord::Migration[7.1]
  def change
    add_column :teas, :title, :string
  end
end
