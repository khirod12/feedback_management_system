class Api::V1::CustomersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_customer, only: [:show, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.all

    render json: @customers.to_json(:include =>:user)
  end

  # GET /customers/1
  def show
    render json: @customer
  end

  # POST /customers
  def create
    @user=User.find(customer_params[:user_id])
    @customer = Customer.new(customer_params)
    @customer.user_id=@user.id
    if @customer.save
      render json: 'success'
    else
      render json: 'failed'
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(:cust_name, :user_id)
    end
end
