class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :parent_id
      t.string :parent_type

      t.timestamps null: false
    end

    add_index :comments, :parent_id
  end
end
