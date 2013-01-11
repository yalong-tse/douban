class CreateDailynotes < ActiveRecord::Migration
  def change
    create_table :dailynotes do |t|
      t.string :title
      t.text :content
      t.string :image
      t.string :link
	  t.integer :user_id

      t.timestamps
    end
  end
end
