class RemoveCommentsClosedFromPost < ActiveRecord::Migration
  def self.up
    remove_column :posts, :comments_closed
  end

  def self.down
    add_column :posts, :comments_closed, :boolean
  end
end
