class AddTrackIdToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :track_id, :string
  end
end
