class AddEndAddressToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :end_address, :string
  end
end
