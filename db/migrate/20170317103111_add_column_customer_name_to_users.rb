class AddColumnCustomerNameToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :customer_name, :string
  end
end
