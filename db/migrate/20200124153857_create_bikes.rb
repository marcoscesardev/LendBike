class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :code, null: false, unique: true
      t.boolean :active, null: false, default: true
      t.boolean :maintenance, null: false, default: false

      t.timestamps
    end
  end
end
