class RemoveCommentsCountFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :comments_count
  end

  def self.down
    add_column :posts, :comments_count, :integer, :default => 0
  end
end
