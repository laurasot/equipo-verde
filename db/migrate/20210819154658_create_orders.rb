class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end

    add_monetize :orders, :total_price, currency: { present: false }
  end
end
