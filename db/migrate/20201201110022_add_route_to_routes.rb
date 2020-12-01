class AddRouteToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :route, :string
  end
end
