class CreateLends < ActiveRecord::Migration[6.0]
  def change
    create_table :lends do |t|
      # ON LEND
      t.references :bike, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.datetime :start_at, null: false
      t.boolean :current, null: false, default: true

      # ON LEAVE
      t.references :station, index: true, foreign_key: true, null: true
      t.integer :distance
      t.datetime :end_at

      t.timestamps
    end
  end
end
