class CreateBuyerSendingDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_sending_destinations do |t|

      t.timestamps
    end
  end
end
