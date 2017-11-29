class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.references :follower
      t.references :leader

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :follower_id
    add_foreign_key :followings, :users, column: :leader_id
  end
end
