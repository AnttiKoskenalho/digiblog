class CommentsController < ApplicationController
	def create
		@post = Post.find( params[ :post_id ] )
		@comment = @post.comments.create( params[ :comment ].permit( :commenter, :body ) )
		redirect_to post_path( @post )
	end
	
	def destroy
		if admin_rights
			@post = Post.find( params[ :post_id ] )
			@comment = @post.comments.find( params[ :id ] )
			@comment.destroy
			redirect_to post_path( @post )
		else
			redirect_to root_url
		end
	end
end
