require "digest"
require "digest/sha2"
require "digest/sha1"

class User < ActiveRecord::Base
  attr_accessible :email, :image, :location, :name, :password, :sex
  has_many :user_groups
  has_many :groups
  before_create :generate_hashed
  before_update :generate_hashed


  def self.authorize(username,password)
	@userinfo = User.find_by_name(username) 
    if @userinfo.nil?
      return false
    else
      return @userinfo if @userinfo.password == User.encrypted_password(password,@userinfo.salt)
    end
  end

  private
  def generate_hashed
    self.salt = self.object_id.to_s + rand.to_s
    self.password = User.encrypted_password(self.password,self.salt)
  end

  # 将密码加密
  def self.encrypted_password(ps,salt)
    string_to_hash = ps + "dailiushu" + salt
    result = Digest::SHA1.hexdigest(string_to_hash)
    return result
  end

end
