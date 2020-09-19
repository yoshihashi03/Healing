class BlogsController < ApplicationController

	 before_action :authenticate_customer!,only: [:new, :create, :edit, :update, :destroy]

  def index
  	@blogs = Blog.all.page(params[:page]).per(8)
  end

  def show
  	@blogs = Blog.all
  	@blog = Blog.find(params[:id])
  	@customer = @blog.customer
  	@blog_comment = BlogComment.new
  	@blog_comments = @blog.blog_comments.page(params[:page]).per(4)
  end

  def new
  	@blog = Blog.new
    @blog.blog_images.build
  end

  def edit
  	@blog = Blog.find(params[:id])
		if @blog.customer_id != current_customer.id
			redirect_to blogs_path
		end
  end

  def search
    @blogs = Blog.where(genre: params[:genre]).page(params[:page]).per(8)
    # @blog_page =Blog.where(genre: params[:genre]).page(params[:page]).per(8)
  end


  def create
  	@blog = Blog.new(blog_params)
  	@blog.customer_id = current_customer.id
    	if @blog.save
      		redirect_to blog_path(@blog)
    	else
      		render :new
    	end
  end

  def update
  	@blog = Blog.find(params[:id])
  		if @blog.update(blog_params)
  	   		redirect_to blog_path(@blog)
    	else
    		render :edit
      end
  end

  def destroy
  	blog = Blog.find(params[:id])
  		blog.destroy
  		redirect_to blogs_path
  end


  private
  	def blog_params
  		params.require(:blog).permit(:title, :body, :address, :genre, :url_content, blog_images_photos: [])
  	end

end
