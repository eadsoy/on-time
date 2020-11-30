class CreateStarts < ActiveRecord::Migration[6.0]
  def change
    create_table :starts do |t|
      t.float :longitude
      t.float :latitude
      t.string :address

      t.timestamps
    end
  end
end
