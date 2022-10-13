class AddLikesCountToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :likes_count, :integer, default: 0, null: false
  end
end
