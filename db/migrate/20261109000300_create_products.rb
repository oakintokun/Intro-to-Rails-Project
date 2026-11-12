class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.decimal :rating, precision: 2, scale: 1, null: false
      t.string :skin_type, null: false
      t.string :source_code, null: false
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.timestamps
    end
    add_index :products, :source_code, unique: true
  end
end
