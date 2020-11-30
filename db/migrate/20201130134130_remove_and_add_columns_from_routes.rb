class RemoveAndAddColumnsFromRoutes < ActiveRecord::Migration[6.0]
  def change
    remove_column :routes, :start_lat
    remove_column :routes, :start_lon
    remove_column :routes, :end_lat
    remove_column :routes, :end_lon
    add_reference :routes, :start
    add_reference :routes, :end
  end
end
