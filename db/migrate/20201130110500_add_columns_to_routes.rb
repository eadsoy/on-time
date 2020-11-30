class AddColumnsToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :start_lon, :float
    add_column :routes, :end_lon, :float
  end
end
