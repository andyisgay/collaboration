class RenameViewCountInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :view_count, :views
  end
end
