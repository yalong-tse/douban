class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :topic_id
      t.text :content
      t.string :image
	  t.integer :topic_id

      t.timestamps
    end
  end
end
