class PostsController < ApplicationController

  before_action do
    if @current_user.blank?
      redirect_to sign_in_path
    else
      redirect_to confirm_pending_path unless @current_user.confirmed?
    end
  end

  def index
    search_text = params[:search]
    @posts = Post.all
    if search_text.present?
      @posts = @posts.search.all(params[:search])
  end
end

  def show
    @post = Post.find_by id: params[:id]
  end

  def share
    @post = Post.find_by id: params[:id]
  end
  #email this email via email to someone's email
  PostsMailer.share(@post).deliver_now

  redirect_to root_path
 end
