#encoding: utf-8
# 这是话题的Model,每个讨论组 group 可以创建和管理话题
class Topic < ActiveRecord::Base
  attr_accessible :description,:link, :title,:group_id,:user_id,:attachment_id,:image
  belongs_to :group
  has_many :posts
  belongs_to :user
  belongs_to :attachment
  #before_save :set_user
  
  
  def save_image(file)
    if !file.nil?
        @attachment = Attachment.new
        rename =  @attachment.save_att(file) 
        @attachment.save
        self.attachment_id = @attachment.id
        self.image = rename
        return rename
    end # end if end # end if
  end



  private
  def set_user
    if session[:user_id]
      self.user_id = session[:user_id]
    end
  end


end
