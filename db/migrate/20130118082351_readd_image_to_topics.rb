class ReaddImageToTopics < ActiveRecord::Migration
  def up
    add_column :topics,:image,:string
  end

  def down
    remove_column :topics,:image
  end
end
