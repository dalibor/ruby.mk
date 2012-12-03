class DropCommentsTable < ActiveRecord::Migration
  def self.up
    drop_table :comments
  end

  def self.down
    create_table :comments do |t|
      t.references :post
      t.string :name
      t.string :email
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
