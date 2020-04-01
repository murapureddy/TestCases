class PostsController < ApplicationController
	#before_action :set_user_post,only: [:create]
	def index
	  @posts = Post.all
	end

	def new
	  @post = Post.new
	end

	def create
		debugger
	 @current_user=User.find(params[:post][:user_id])
	 @post =  @current_user.posts.new(post_params)
	 if @post.save
      flash[:notice]="The post was sucessfully created"
      redirect_to @post
    else
      render 'new'
    end
	end

	def show
	 @post = Post.find(params[:id])
	end

	def edit
	 @post = Post.find(params[:id])
	end

	def destroy
	  @post = Post.find(params[:id])
	end

	

	private

	def post_params
     params.require(:post).permit(:title,:description,:user_id)
	end


end
