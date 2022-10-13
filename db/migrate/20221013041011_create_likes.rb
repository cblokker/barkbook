class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :dog, foreign_key: true, null: false

      t.timestamps
    end

    add_index :likes, [:user_id, :dog_id], unique: true
  end
end
