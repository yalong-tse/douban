class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.string :savepath
      t.string :savefilename
      t.string :filetype

      t.timestamps
    end
  end
end
