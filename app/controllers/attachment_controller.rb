class AttachmentController < ApplicationController
  def download
    @attachment_id = params[:attachment]
    if (@attachment_id)
       @attchemnt = Attachment.find(@attachment_id)
    end
  end
end
