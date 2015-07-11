class PagesController < ApplicationController
	#layout 'admin'
  def home
  end

  def about
  	@name = params[:name]
  	#render layout: 'admin' #指定版型
  end

  def math
  	@numbers = (1..46).to_a.sample(6)
  end
end
