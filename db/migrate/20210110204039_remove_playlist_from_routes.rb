class RemovePlaylistFromRoutes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :routes, :playlist, null: false, foreign_key: true
  end
end
