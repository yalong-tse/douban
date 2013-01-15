#encoding: utf-8
#日记的跟帖Model
class Dailypost < ActiveRecord::Base
  attr_accessible :content, :dailynote_id, :image
  belongs_to :dailynote
end
