class CommentsController < ApplicationController

  def create
    @post = Post.friendly.find(params[:post_id])
    @comments = @post.comments.create(params[:comment].permit(:name, :content))

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.friendly.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
    @comments.destroy
    flash[:notice] = "The comment has been deleted."

    redirect_to post_path(@post)
  end
end
