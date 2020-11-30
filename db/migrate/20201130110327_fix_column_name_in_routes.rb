class FixColumnNameInRoutes < ActiveRecord::Migration[6.0]
  def change
    rename_column :routes, :start_point, :start_lat
    rename_column :routes, :end_point, :end_lat
  end
end
