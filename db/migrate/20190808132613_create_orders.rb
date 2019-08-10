class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :company_id
      t.timestamps
    end
  end
end
