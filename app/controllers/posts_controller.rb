class PostsController < ApplicationController

	def create
	end

	def index
		@post = Post.all
	end

end
