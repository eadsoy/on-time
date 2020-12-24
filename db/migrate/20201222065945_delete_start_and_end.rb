class DeleteStartAndEnd < ActiveRecord::Migration[6.0]
  def change
    drop_table :starts do |t|
      t.float "longitude"
      t.float "latitude"
      t.string "address"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    drop_table :ends do |t|
      t.float "longitude"
      t.float "latitude"
      t.string "address"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
