class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :introduction
      t.string :icon
      t.string :label

      t.timestamps
    end
  end
end
