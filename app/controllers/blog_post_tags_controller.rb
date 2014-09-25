class BlogPostTagsController < ApplicationController
  def index
  	@blog_post_tags = BlogPostTag.search(params[:search]).paginate(page: params[:page], per_page: 20, order: "name ASC")
  end
  
  def show
  	@blog_post_tag = BlogPostTag.find(params[:id])
  end
  
  def destroy
  	@blog_post_tag = BlogPostTag.find(params[:id])
    @blog_post_tag.destroy
  end
end