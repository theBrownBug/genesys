class AddPathToVisit < ActiveRecord::Migration[6.1]
  def change
    add_column :visits, :path, :string
  end
end
