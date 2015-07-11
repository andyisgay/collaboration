class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #在此註冊回呼方法，有 only 就有 except，但僅能擇一使用，若皆無設定，表示所有action皆套用
  # 會先執行 authenticate_user!，再執行 set_post
	#GET /posts
  def index
  	@posts = Post.all
  	#會在view中使用#each方法
  end

   #GET /posts/:id
  def show
  end

  #GET /posts/new
  def new
    @post = Post.new
  end 

  # POST /posts
  def create
  	# 期待從 view 那裏會傳來 title 與 content
  	# 兩個變數讓 Post.new 初始化
  	@post = Post.new post_params 
  	#title: params[:title],content: params[:content];
 
  	if @post.save
  	   redirect_to @post
  	   #等於 post_path(@post)
  	else
  	 render :new
  	 #會渲染 app/views/posts/new      
    end

  end	

  #GET /posts/:id/edit
  def edit
  end

  #PUT /posts/:id
  def update
  	if @post.update post_params
  		redirect_to @post
  	else
  	 render :edit
  	 #渲染 app/views/posts/edit.html.erb
  	end
  end	

  #DELETE /posts/:id
  def destroy
    @post.destroy
    redirect_to posts_path
    #刪除後重導到 /posts 文章列表頁
  end  

  private

  def set_post
    @post = Post.find(params[:id])
  end

  #並不是每個實體方法都要給路由表使用
  #使用 private 能用以區別 action 與非 action
  def post_params
  	params.require(:post).permit(:title, :content, :user_id, :tag_ids)
  end	

end
