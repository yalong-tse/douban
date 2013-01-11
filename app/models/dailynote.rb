#encoding: utf-8
# 这是日记的model 类
class Dailynote < ActiveRecord::Base
  attr_accessible :content, :image, :link, :title
  belongs_to :user
end
