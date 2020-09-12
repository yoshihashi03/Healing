class CustomersController < ApplicationController

	 before_action :authenticate_customer!

  def index
  	@customers = Customer.all
  end

  def show
  	@customer = Customer.find(params[:id])
    @blogs = @customer.blogs
  end

  def edit
  	@customer = Customer.find(params[:id])
  	if @customer.id != current_customer.id
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

  # def withdrawal
  #   # @customer = Customer.find(params[:id])
  # end

  def hide
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
  params.require(:customer).permit(:name, :email, :profile_image, :password)
  end

end
