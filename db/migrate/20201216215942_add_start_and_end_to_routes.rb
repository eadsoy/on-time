class AddStartAndEndToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :start, :float
    add_column :routes, :end, :float
  end
end
