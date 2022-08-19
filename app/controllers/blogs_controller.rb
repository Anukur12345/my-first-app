class BlogsController < ApplicationController
		def index
		#debugger
		@blog = Blog.all
	end

	def show
		#debugger
		@user = User.find(params[:user_id])
		@blog = @user.blogs
	end

	def new
		#debugger
		@user = User.find(params[:user_id])
		@blog = Blog.new
	end
	
	

	def create
		#debugger
		@user = User.find(params[:user_id])
		@blog = @user.blogs.create(blog_params)
		redirect_to new_user_blog_path(@user)
	end

	def edit
		#debugger
		@user = User.find(params[:user_id])
		@blog = @user.blogs.find(params[:id])
	end

	def update
		#debugger
		@user = User.find(params[:user_id])
		@blog = @user.blogs.find(params[:id])
		@blog.update(blog_params)
		redirect_to new_user_blog_path(@user)
	end

	def destroy
		#debugger
		@user = User.find(params[:user_id])
		@blog = @user.blogs.find(params[:id])
		@blog.destroy
		redirect_to new_user_blog_path(@user)
	end

	def is_approved
		#debugger
		@blog = Blog.find(params[:blog_id])
		@blog.update(status: true)
		redirect_to welcome_index_path 
	end


	private
	#debugger
	def blog_params
		params.require(:blog).permit(:name, :title, :description)
	end

end
