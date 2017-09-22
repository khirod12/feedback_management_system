json.extract! customer, :id, :cust_name, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
