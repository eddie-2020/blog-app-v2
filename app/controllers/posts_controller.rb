class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.order(created_at: :desc).includes(:comments, :likes)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: 'Successfully created post.'
    else
      render :new, alert: 'Post was not saved'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])

    if @post.destroy
      redirect_to root_path, notice: 'Successfuly deleted post.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
