class PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :find_post, only: [:edit, :update, :show, :delete]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post created successfully!'
      redirect_to @post
    else
      flash[:alert] = 'Error creating post!'
      render 'new'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post updated successfully!'
      redirect_to @post
    else
      flash[:alert] = 'Error updating post!'
      rennder 'edit'
    end
  end

  def show; end

  def destroy
    if @post.destroy
      flash[:notice] = 'Successfully deleted post!'
      redirect_to posts_path
    else
      flash[:alert] = 'Error deleting post!'
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
