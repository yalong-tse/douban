class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :sex
      t.string :email
      t.string :password
      t.string :image
      t.string :location

      t.timestamps
    end
  end
end
