class ModifyPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :view_count, :integer
  end
end
