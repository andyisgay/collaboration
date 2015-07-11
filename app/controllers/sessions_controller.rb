# coding: UTF-8
class SessionsController < ApplicationController
	# POST /session
	def create
		user = User.find_by(email: params[:email])
		if user = user.try(:authenticate, params[:password])
		 #登入成功，設定 session
         session[:user_id] = user.id
         # Rails 的 session 操作就像操作 'Hash' 一樣
         message = "歡迎回來!#{user.name}"
        else
         message = '登入失敗'
        end
        redirect_to root_path, notice: message
    end  

    #DELETE /session
    def destroy 
    	session.delete(:user_id) 
    	#session[:user_id] = nil 是不正確的
    	#因為仍會殘留鍵在裡面，只是值 nil
    	redirect_to root_path, notice: '登出'
    end	

end
