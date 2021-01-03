class ChangeStartAndEndToStringInRoute < ActiveRecord::Migration[6.0]
  def change
    change_column(:routes, :start, :string)
    change_column(:routes, :end, :string)
  end
end
