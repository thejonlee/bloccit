class AddTopicToPosts < ActiveRecord::Migration[5.1]
  def change
    # adds a topic_id column to the posts table
    add_column :posts, :topic_id, :integer
    # an index improves speed of operations on a database table
    add_index :posts, :topic_id
  end
end
