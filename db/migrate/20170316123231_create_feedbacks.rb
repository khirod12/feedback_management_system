class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :project_name
      t.string :app_name
      t.string :app_comp
      t.string :feedback_title
      t.text :feedback_desc
      t.binary :screenshot
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
