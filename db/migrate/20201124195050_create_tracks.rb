class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
