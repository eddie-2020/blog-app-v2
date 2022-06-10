class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:posts_id])
    new_comment = current_user.comments.new(params.require(:comment).permit(:text))
    new_comment.posts_id = @post.id
    new_comment.save
    redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
  end
end
