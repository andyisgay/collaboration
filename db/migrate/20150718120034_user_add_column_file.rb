class UserAddColumnFile < ActiveRecord::Migration
  def self.up
  	add_attachment :users, :file 
  end

  def self.down
  	remove_attachment :users, :file 
  end
end 
