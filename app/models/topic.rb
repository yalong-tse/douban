#encoding: utf-8
# 这是话题的Model,每个讨论组 group 可以创建和管理话题
class Topic < ActiveRecord::Base
  attr_accessible :description, :image, :link, :title,:group_id
  belongs_to :group
end
