class Api:: PostsController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    search_text = params[:search]
    @posts = Post.all
    if search_text.present?
       @posts = @posts.search_all(params[:search])
    end
  end

  def authors
    render json: {authors:  Post.pluck(:author).uniq.sort}
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def create
    @post = Post.new params.require(:post).permit(:author, :title, :content)
    if @post.save
      render :show
    else
      render json: @post.errors, status: 422
  end
 end
end
