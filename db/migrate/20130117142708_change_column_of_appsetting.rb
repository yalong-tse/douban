class ChangeColumnOfAppsetting < ActiveRecord::Migration
  def up
    rename_column :appsettings,:type,:settingtype
  end

  def down
    rename_column :appsettings,:settingtype,:setting
  end
end
