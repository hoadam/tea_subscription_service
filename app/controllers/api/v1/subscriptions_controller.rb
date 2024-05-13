class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_customer

  def create
    subscription = @customer.subscriptions.create!(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: :created
  end

  def destroy
    subscription = @customer.subscriptions.find(params[:id])
    subscription.destroy
    render json: { message: 'Subscription successfully destroyed' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Subscription not found' }, status: :not_found
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def subscription_params
    params.require(:subscription).permit(:tea_id, :customer_id, :title, :price, :frequency, :status)
  end
end
