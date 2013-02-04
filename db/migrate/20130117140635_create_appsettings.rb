class CreateAppsettings < ActiveRecord::Migration
  def change
    create_table :appsettings do |t|
      t.string :name
      t.string :value
      t.string :type

      t.timestamps
    end
  end
end
