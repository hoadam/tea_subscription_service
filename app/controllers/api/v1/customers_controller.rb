class Api::V1::CustomersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  before_action :set_customer

  def show
    render json: CustomerSerializer.new(@customer, { include: [:subscriptions] })
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :address)
  end

  def not_found_response(exception)
    render json: ErrorMessageSerializer.new(ErrorMessage.new(exception.message, 404)).serializer_json, status: :not_found
  end
end
