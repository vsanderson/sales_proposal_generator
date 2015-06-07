class CustomersController < ApplicationController
  before_action :require_user
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = current_user.customers
  end

  def show
  end

  def new
    @customer = current_user.customers.build
  end

  def edit
  end

  def create
    @customer = current_user.customers.build(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private
  def set_customer
    @customer = Customer.where(user_id: current_user).find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :category)
  end
end
