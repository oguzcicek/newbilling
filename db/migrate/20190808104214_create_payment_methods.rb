class CreatePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.integer :sell_price
      t.string :method
      t.timestamps
    end
  end
end
