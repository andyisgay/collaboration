# coding: UTF-8 
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :user_signed_in?
  #將以上兩方法設定成view helper
  
  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  	#等於 
  	# @current_user = @current_user || User.find_by(session[:user_id])
  	# 實體變數用於快取，為了避免重複對資料庫下指令
  end
  
  def user_signed_in?
    current_user != nil
  end
  

  def authenticate_user!
  	unless user_signed_in?
  		redirect_to request.referer, notice: '請先登入'
  		# request.referer 回傳本次請求的上一頁的網址
  	end	
  end	
  
end
