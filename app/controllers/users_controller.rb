class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :calendar_view]
	def index
	 @user = User.all
    end
    
    #GET /users/:user_id
    def show
      #@events = Event.all 
    end
    
    def edit
      #render :calendar_view
    end	

      #PUT /users/:user_id
    def update
  	 if @user.update user_params
  		redirect_to @user
  	 else
  	 render :edit
  	 #渲染 app/views/posts/edit.html.erb
  	 end
    end	

    def calendar_view
    end    

    private

    def set_user
     @user = User.find(params[:id])
    end

    def user_params
  	 params.require(:user).permit(:name, :email, :file)
    end	
end
