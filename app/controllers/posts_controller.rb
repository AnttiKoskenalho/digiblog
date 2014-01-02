class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	
	def new
		if admin_rights
			@post = Post.new
		else
			redirect_to root_url
		end
	end
	
	def create
		if admin_rights
			@post = Post.new( post_params )
			
			if @post.save
				redirect_to @post
			else
				render 'new'
			end
		else
			redirect_to root_url
		end
	end
	
	def show
		@post = Post.find( params[:id] )
	end
	
	def edit
		if admin_rights
			@post = Post.find( params[:id] )
		else
			redirect_to root_url
		end
	end
	
	def update
		if admin_rights
			@post = Post.find( params[:id] )
			
			if @post.update( post_params )
				redirect_to @post
			else
				render 'edit'
			end
		else
			redirect_to root_url
		end
	end
	
	def destroy
		if admin_rights
			@post = Post.find( params[:id] )
			@post.destroy
			
			redirect_to posts_path
		else
			redirect_to root_url
		end
	end
	
	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
