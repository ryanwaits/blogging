class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show

  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def require_login
    unless current_user
      redirect_to root_path
      flash.notice = 'You must be logged in to post.'
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end