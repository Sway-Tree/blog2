class Admin::CommentsController < Admin::AdminsController
	def create
    	@post = Post.find(params[:post_id])
   		@comment = @post.comments.create(params[:comment].permit(:author, :body))
    	redirect_to admin_post_path(@post)
  	end

  	def destroy
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.find(params[:id])
    	@comment.destroy
    	redirect_to admin_post_path(@post)
  	end
end
