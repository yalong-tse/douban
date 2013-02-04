#encoding: utf-8

class WelcomeController < ApplicationController
  layout "login"
  def login
    unless request.get?
	  @username = params[:user][:name]
	  @password = params[:user][:password]
      @user = User.authorize(@username,@password)
      if @user
        session[:user_id] = @user.id
        session[:user_name] = @user.name
        flash[:notice] = "用户已经成功登录"
        redirect_to groups_path
      else
        flash[:notice] = "用户名或者密码错误";
        redirect_to welcome_index_path
      end
	end
  end

  def index
     if session[:user_id] 
        # 不为空
	    redirect_to groups_path
	 else
        # session 为空
        render :template=>"welcome/login"
	 end
  end

  # 用户登出的action
  def logout
     session[:user_id] = nil
     session[:user_name] = nil
	 flash[:notice] = "用户已经退出"
	 redirect_to :action=>:index
  end
end
