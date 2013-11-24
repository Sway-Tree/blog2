class Admin::PostsController < Admin::AdminsController
	def new
		@post = Post.new
	end

	def create
  		@post = Post.new(params[:post].permit(:title, :text))
 
  		#if @post.save
    	#	redirect_to admin_post_path(@post)
  		#else
    	#	render 'new'
  		#end
    begin
      Admin::PostCreationService.new.process(@post)
    rescue Admin::PostCreationService::PostCreationError
      render 'new'
    end

      redirect_to admin_post_path(@post)
	end

	def show
  		@post = Post.find(params[:id])
	end

	def index
 		@posts = Post.all
	end

	def edit
  		@post = Post.find(params[:id])
	end

	def update
  		@post = Post.find(params[:id])
 
  		if @post.update(params[:post].permit(:title, :text))
    		redirect_to admin_post_path(@post)
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@post = Post.find(params[:id])
  		@post.destroy
 
  		redirect_to admin_posts_path
	end
 
	private
  	def post_params
    	params.require(:post).permit(:title, :text)
  	end

end

class Admin::PostCreationService

  class PostCreationError < StandardError; end

  def intialize
  end

  def process(post)
    unless post.save 
      raise PostCreationError.new
    end
  end

end