class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def index
    @posts = Post.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(5).order("created_at DESC")
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
    @comments = @post.comments
    @comment = Comment.new
    @favorite = Favorite.new
    @new_comments = Comment.new
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

  def index_list
    @posts = Post.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(20).order("created_at DESC")
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.order("created_at DESC")
    
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image, tag_ids: [])
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != current_user.id
      flash[:notice] = "エラー：自分の質問のみ編集・削除可能です。"
      redirect_to root_path
    end
  end
end
