class PostsController < ApplicationController

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
	end

	def index
		@posts = Post.all
		#@tags = @post.tag.find(params[:tag_id])
		#@post_tags = @tags.all
		@tag_list = Tag.all
		post = Post.new
		@user = current_user
	end

	def show
		@post = Post.find(params[:id])
		@post_tags = @post.tags
	end

	def search
		@tag_list= Tag.all
		@tag = Tag.find(params[:tag_id])
		@posts = @tag.posts.all
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		post.update(post_params)
		redirect_to post_path(post.id)
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:content)
		end

end
