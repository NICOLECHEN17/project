class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps null: false
    end
    add_index :comments, :micropost_id
  end
end
