class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def edit 
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer
    else
      render :new, status: :unprocessable_entity
    end
  end


  # we pass a single hash with all the data when we create a particular customer
  # however, without this method, we would be exposed to a malicious actor modifying
  # the payload and adding extra data at their will.

  private
    def customer_params
      params.require(:customer).permit(:firstname, :lastname, :email)
    end
end
