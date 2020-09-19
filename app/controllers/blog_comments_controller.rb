class BlogCommentsController < ApplicationController

	before_action :authenticate_customer!

  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = current_customer.blog_comments.new(blog_comment_params)
    @blog_comment.blog_id = @blog.id
    @blog_comment.save
      redirect_to request.referer
  end

  def destroy
    blog_comment = BlogComment.find(params[:id])
    blog_comment.destroy
    redirect_to request.referer
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end

end
