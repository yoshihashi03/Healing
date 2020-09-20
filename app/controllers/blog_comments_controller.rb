class BlogCommentsController < ApplicationController

	before_action :authenticate_customer!

  def create
    @blog = Blog.find(params[:blog_id])
    blog_comment = current_customer.blog_comments.new(blog_comment_params)
    blog_comment.blog_id = @blog.id
    blog_comment.save
    @count = @blog.blog_comments.count
    @blog_comments = @blog.blog_comments.order(created_at: :desc).page(params[:page]).per(4)
  end

  def destroy
    blog_comment = BlogComment.find(params[:id])
    blog_comment.destroy
    @blog = blog_comment.blog
    @count = @blog.blog_comments.count
    @blog_comments = @blog.blog_comments.order(created_at: :desc).page(params[:page]).per(4)
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end

end
