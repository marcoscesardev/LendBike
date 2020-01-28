class CreateLends < ActiveRecord::Migration[6.0]
  def change
    create_table :lends do |t|
      # ON LEND
      t.references :bike, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :origin, index: true, foreign_key: { to_table: :stations }
      t.datetime :start_at, null: false

      # ON LEAVE
      t.references :destiny, index: true, foreign_key: { to_table: :stations }
      t.integer :distance
      t.datetime :end_at

      t.timestamps
    end
  end
end
