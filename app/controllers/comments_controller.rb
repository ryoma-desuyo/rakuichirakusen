class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_path, alert: 'コメントできませんでした'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.post, flash: { notice: 'コメントが削除されました' }
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:reply_comment)
  end
end
