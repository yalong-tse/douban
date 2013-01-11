#encoding: utf-8
# 话题的跟帖回帖的 Model 
class Post < ActiveRecord::Base
  attr_accessible :content, :image, :topic_id
  belongs_to :topic
end
