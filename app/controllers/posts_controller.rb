class PostsController < ApplicationController

	def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
	end

	def index
		@post = Post.all
		@tag = Tag.all
		@post = current_user.posts.new
	end

	def show
		@post = Post.find(params[:id])
		@post_tags = @post.tags
	end


	private
		def post_params
			params.require(:post).permit(:content)
		end

end
