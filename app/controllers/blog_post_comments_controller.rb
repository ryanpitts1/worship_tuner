class BlogPostCommentsController < ApplicationController
  # Saves the blog post comment object to the database.
  def create
    @blog_post_comment = BlogPostComment.new(params[:blog_post_comment])
    if @blog_post_comment.save
      flash[:success] = "Your comment has been successfully published to this post."
      redirect_to blog_post_path(params[:blog_post_comment][:blog_post_id])
    else
   	  flash[:error] = "Please fill in all required fields and try commenting again."
      redirect_to :back
    end
  end
  
  # Deletes the specified blog post comment from the database.
  def destroy
    @blog_post_comment = BlogPostComment.find(params[:id])
    @blog_post_comment.destroy
    flash[:success] = "Comment has been deleted."
    redirect_to :back
  end
end