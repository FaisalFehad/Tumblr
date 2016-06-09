class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.create(params[:comment].permit(:name, :content))

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
    @comments.destroy

    redirect_to post_path(@post)
  end
end
