class PagesController < ApplicationController
	#layout 'admin'
  def home
    #@user = User.first
  end

  def about
  	@name = params[:name]
  	#render layout: 'admin' #指定版型
  end

  def math
  	@numbers = (1..49).to_a.sample(6)
  end
end
