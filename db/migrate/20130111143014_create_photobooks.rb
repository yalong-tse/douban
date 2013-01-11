class CreatePhotobooks < ActiveRecord::Migration
  def change
    create_table :photobooks do |t|
      t.string :name
      t.string :description
      t.string :preface
	  t.integer :user_id

      t.timestamps
    end
  end
end
