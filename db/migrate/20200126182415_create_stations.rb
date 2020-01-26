class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.boolean :active, null: false, default: true
      t.string :code, null: false, unique: true
      t.string :address, null: false
      t.string :name, null: false
      t.integer :vacancies, null: false

      t.timestamps
    end
  end
end
