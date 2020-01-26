class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :code, null: false, unique: true
      t.integer :situation
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
