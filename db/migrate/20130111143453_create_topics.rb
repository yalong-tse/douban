class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :image
      t.string :link
      t.text :description
	  t.integer :group_id

      t.timestamps
    end
  end
end
