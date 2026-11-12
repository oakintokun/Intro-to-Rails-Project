class CreateBrands < ActiveRecord::Migration[8.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.timestamps
    end
    add_index :brands, :name, unique: true
  end
end
