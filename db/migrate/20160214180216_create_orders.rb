class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.decimal :total_amount_net
      t.decimal :shipping_costs
      t.string :payment_method

      t.timestamps null: false
    end
  end
end
