class RemoveStartAndEndFromRoute < ActiveRecord::Migration[6.0]
  def change
    remove_reference :routes, :start, index: true
    remove_reference :routes, :end, index: true
  end
end
