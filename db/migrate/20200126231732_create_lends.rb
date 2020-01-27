class CreateLends < ActiveRecord::Migration[6.0]
  def change
    create_table :lends do |t|
      t.references :bike, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :origin, index: true, foreign_key: {to_table: :stations}
      t.references :detiny, index: true, foreign_key: {to_table: :stations}
      t.string :code, null: false, unique: true
      t.string :address, null: false
      t.integer :distance, null: false, default: 0
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
