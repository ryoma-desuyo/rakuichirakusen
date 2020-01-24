class SearchesController < ApplicationController
  def index
    @posts = Post.search(params[:search]).order(created_at: :desc).limit(132)
    @search = params[:search]
  end
end
