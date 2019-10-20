class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path,success:'コメントしました'
    else
      flash.now[:danger] = "コメント失敗しました"
      render "comments/new"
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :content)
  end
end
