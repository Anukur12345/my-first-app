class CommentsController < ApplicationController
	def create
		#debugger
		@user = User.find(params[:user_id])
		@blog = @user.blogs.find(params[:blog_id])
		@comment = @blog.comments.create(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to new_user_blog_path(@user)
	end

	def new
	end



	def comment_params
		#debugger
		params.require(:comment).permit(:content)
	end
end
