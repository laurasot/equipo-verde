class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :conent
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_monetize :products, :price, currency: { present: false }
  end
end
