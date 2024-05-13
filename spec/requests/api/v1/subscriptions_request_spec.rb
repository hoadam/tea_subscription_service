require 'rails_helper'

describe "Subscriptions Endpoints" do
  describe "post request" do
    it "creates a new subscription for a specified customer" do
      tea = Tea.create!({ title: "Green Tea", description: "Savory", temperature: 80, brew_time: 3 })
      customer = Customer.create!({ first_name: "Emma", last_name: "Watson", email: "emma@gmail.com", address: "456 Broadway St" })

      headers = { "Content-Type" => "application/json", accept => 'application/json' }
      subscription_params = {tea_id: tea.id, customer_id: customer.id, price: 12, frequency: 1, status: 0, title: tea.title}

      post "/api/v1/customers/#{customer.id}/subscriptions", params: { subscription: subscription_params }.to_json, headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(201)

      result = JSON.parse(response.body, symbolize_names: true)

      data = result[:data]

      expect(data).to have_key(:id)
      expect(data[:id]).to be_a(String)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("subscription")
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      attributes = data[:attributes]

      expect(attributes).to have_key(:tea_id)
      expect(attributes[:tea_id]).to eq(tea.id)
      expect(attributes).to have_key(:customer_id)
      expect(attributes[:customer_id]).to eq(customer.id)
      expect(attributes).to have_key(:price)
      expect(attributes[:price]).to eq(12)
      expect(attributes).to have_key(:frequency)
      expect(attributes[:frequency]).to eq("once_per_month")
      expect(attributes).to have_key(:status)
      expect(attributes[:status]).to eq("active")
    end
  end

  describe "destroy request" do
    it "deletes a subscription for a specified customer" do
      tea_1 = Tea.create!({ title: "Green Tea", description: "Savory", temperature: 80, brew_time: 3 })

      customer = Customer.create!({ first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", address: "123 Main St" })

      subscription = Subscription.create!({ tea_id: tea_1.id, customer_id: customer.id, title: tea_1.title, price: 12, frequency: 1, status: 0 })

      delete "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}"
      expect { subscription.reload }.to raise_error ActiveRecord::RecordNotFound
      expect(response).to have_http_status(:ok)
    end
  end
end
