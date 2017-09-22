class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :cust_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
