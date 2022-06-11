class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])

    redirect_to user_posts_url(current_user, @posts), notice: 'Successfully liked.' if @like.save
  end
end
