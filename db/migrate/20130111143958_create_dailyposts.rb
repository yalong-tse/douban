class CreateDailyposts < ActiveRecord::Migration
  def change
    create_table :dailyposts do |t|
      t.integer :dailynote_id
      t.text :content
      t.string :image
	  t.integer :dailynote_id

      t.timestamps
    end
  end
end
