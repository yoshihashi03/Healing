class CustomersController < ApplicationController

	 before_action :authenticate_customer!

  def index
  	@customers = Customer.all.page(params[:page]).per(6)
    @customer = current_customer
  end

  def show
  	@customer = Customer.find(params[:id])
    @blogs = @customer.blogs.page(params[:page]).per(6)
  end

  def edit
  	@customer = Customer.find(params[:id])
  	unless @customer.id == current_customer.id || admin_customer?
      redirect_to customer_path(current_customer)
    end
  end
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
   		redirect_to customer_path(@customer)
    else
    	render :edit
    end
  end

   def favorite
      @customer = Customer.find(params[:id])
      @blogs = @customer.blogs
      @favorites = Blog.where(id: blog_id = Favorite.where(customer_id: current_customer.id).select(:blog_id)).all.page(params[:page]).per(8)
   end

  def hide
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
  params.require(:customer).permit(:name, :email, :profile_image, :password)
  end

  def admin_customer?
    current_customer.admin?
  end

end
