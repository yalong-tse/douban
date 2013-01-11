class Photobook < ActiveRecord::Base
  attr_accessible :description, :name, :preface
  belongs_to :user
end
