class BlogPostsController < ApplicationController
  # Verifies that the user is singed in.
  before_filter :authenticate_user_is_admin, except: [ :show, :index ]
  
  # Gets a list of all blog posts.
  def index
    @blog_posts = BlogPost.search(params[:search]).paginate(page: params[:page], per_page: 5, conditions: ["status = ?", "1"], order: "created_at DESC, title DESC")
    @popular_blog_posts = BlogPost.find(:all, select: "blog_posts.*, COUNT(blog_post_comments.id) AS number_of_comments", joins: :blog_post_comments, group: "blog_posts.id", order: "number_of_comments DESC")
    @recent_blog_posts = BlogPost.find(:all, limit: 5, order: "created_at DESC")
  end
  
  # Display all blog posts (draft and live posts) as well as label counts and other dashboard items.
  def dashboard
    @blog_posts = BlogPost.search(params[:search]).paginate(page: params[:page], per_page: 20, order: "created_at DESC, title DESC")
  end
  
  # Gets a speific blog post.
  def show
    @blog_post = BlogPost.find(params[:id])
    @blog_post_comment = BlogPostComment.new
    @blog_post_comments = BlogPostComment.paginate(page: params[:page], per_page: 10, conditions: ["blog_post_id = ?", params[:id]], order: "created_at DESC, id DESC")
  end
  
  # Builds a new blog post object.
  def new
    @blog_post = BlogPost.new
  end
  
  # Saves the blog post object to the database.
  def create
    @blog_post = BlogPost.new(params[:blog_post])
    if @blog_post.save
      flash[:success] = "\"#{@blog_post.title}\" song has been successfully published to your blog."
      redirect_to blog_post_path(@blog_post)
    else
      render 'new'
    end
  end
  
  # Gets the blog post that has been requested for editing.
  def edit
    @blog_post = BlogPost.find(params[:id])
  end
  
  # Saves the updated blog post object to the database.
  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update_attributes(params[:blog_post])
      flash[:success] = "\"#{@blog_post.title}\" post has been updated."
      redirect_to blog_post_path(@blog_post)
    else
      render 'edit'
    end
  end
  
  # Deletes the specified blog post from the database.
  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    flash[:success] = "\"#{@blog_post.title}\" post has been deleted."
    redirect_to dashboard_blog_posts_path
  end
  
  private

    def authenticate_user_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.try(:admin?))
    end
end