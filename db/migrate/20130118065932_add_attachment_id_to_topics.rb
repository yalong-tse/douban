class AddAttachmentIdToTopics < ActiveRecord::Migration
  def change
    remove_column :topics,:media
    add_column :topics,:attachment_id,:integer
  end
end
