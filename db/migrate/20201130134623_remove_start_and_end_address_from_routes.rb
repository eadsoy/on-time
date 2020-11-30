class RemoveStartAndEndAddressFromRoutes < ActiveRecord::Migration[6.0]
  def change
    remove_column :routes, :start_address
    remove_column :routes, :end_address
  end
end
