class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :point_id
      t.string :point_type

      t.timestamps null: false
    end

    add_index :votes, :point_id
  end
end
