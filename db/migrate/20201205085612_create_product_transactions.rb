class CreateProductTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_transactions do |t|

      t.timestamps
    end
  end
end
