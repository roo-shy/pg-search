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
    @posts = Post.a;;
    if search_text.present?
      @posts = @posts.search.all(params[:search])
  end
end

end
