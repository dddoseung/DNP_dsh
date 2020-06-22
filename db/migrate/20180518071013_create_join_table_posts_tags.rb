class CreateJoinTablePostsTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :posts, :id => false do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true

      t.index [:post_id, :tag_id]
      t.index [:tag_id, :post_id]
    end
  end
end
