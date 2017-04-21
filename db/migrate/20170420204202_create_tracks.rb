class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name, null:false
      t.integer :album_id, null:false
      t.boolean :bonus, default: false

      t.timestamps
    end
  end
end
