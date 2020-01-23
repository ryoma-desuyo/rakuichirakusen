class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "「#{@post.title}」の質問が投稿されました!"
      redirect_to @post
    else
      flash[:notice] = "「#{@post.title}」の質問の投稿に失敗しました。"
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "「#{@post.title}」の記事を更新しました!"
      redirect_to @post
    else
      flash[:notice] = "「#{@post.title}」の記事の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "「#{@post.title}」の記事を削除しました!"
      redirect_to root_path
    else
      flash[:notice] = "「#{@post.title}」の記事を削除できませんでした。"
      redirect_to root_path
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
