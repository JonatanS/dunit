class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.belongs_to :user, index: true
      t.string :subject_type
      t.integer :subject_id
      t.boolean :hidden

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
  end
end
