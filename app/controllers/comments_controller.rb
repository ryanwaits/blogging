class CommentsController < ApplicationController
  def create
    if current_user
      post = Post.find(params[:post_id])
      comment = post.comments.new(comment_params)
      comment.user_id = session[:user_id]
      comment.post_id = post.id
      if comment.save
        redirect_to post_path(post)
      end
    else
      redirect_to root_path
      flash.notice = 'You have to log in to comment.'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

end
