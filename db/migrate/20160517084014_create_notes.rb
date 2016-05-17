class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :text
      t.integer :post_id
      t.integer :user_id
      t.references :comment, index: true

      t.timestamps null: false
    end

  end
end
