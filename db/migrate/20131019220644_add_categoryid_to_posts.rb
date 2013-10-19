class AddCategoryidToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :categoryid, :integer
  end
end
