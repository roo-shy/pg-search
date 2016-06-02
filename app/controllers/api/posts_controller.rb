class Api:: PostsController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    search_text = params[:search]
  end
