json.extract! feedback, :id, :project_name, :app_name, :app_comp, :feedback_title, :feedback_desc, :screenshot, :user_id, :customer_id, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
