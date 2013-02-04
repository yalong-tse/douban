#encoding: utf-8
# 话题的跟帖回帖的 Model 
class Post < ActiveRecord::Base
  attr_accessible :content, :image, :topic_id,:user_id
  belongs_to :topic
  belongs_to :user
  #before_save :set_user
  validate :content, :presence=>true
  validates_length_of :content,:minimum=>10


  private
  def set_user
    self.user_id = session[:user_id]
  end
end
