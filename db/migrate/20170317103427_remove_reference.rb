class RemoveReference < ActiveRecord::Migration[5.0]
  def change
  	remove_reference :feedbacks, :customer, index: false
  end
end
