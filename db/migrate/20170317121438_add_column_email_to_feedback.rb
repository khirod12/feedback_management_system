class AddColumnEmailToFeedback < ActiveRecord::Migration[5.0]
  def change
  	add_column :feedbacks, :email, :string
  end
end
