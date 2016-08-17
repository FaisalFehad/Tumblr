class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def view
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
      flash[:notice] = "The post has been created."
    else
      render 'new'
      flash[:alert] = "Error has occurred. Please make sure that your post
                                                    is valid and try again."
    end
  end

  def show
    find_post
  end

  def edit
    find_post
  end

  def update
    find_post
    if @post.update(params[:post].permit(:title, :content))
      redirect_to @post
      flash[:notice] = "The post has been updated."
    else
      render 'edit'
      show_post_error
    end
  end

  def destroy
    find_post
    @post.destroy
    redirect_to root_path
    flash[:notice] = "The post has been deleted."
  end

  private

  def show_post_error
    flash[:alert] = "Error has occurred. Please validate the data you submitting
                                                                  and try again."
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
