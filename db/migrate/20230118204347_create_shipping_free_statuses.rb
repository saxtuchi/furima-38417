class CreateShippingFreeStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_free_statuses do |t|

      t.timestamps
    end
  end
end
