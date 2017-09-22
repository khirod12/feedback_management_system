class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.integer :vote_count
      t.references :feedback, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
