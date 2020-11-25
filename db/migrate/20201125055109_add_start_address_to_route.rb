class AddStartAddressToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :start_address, :string
  end
end
