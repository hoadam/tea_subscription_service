require 'rails_helper'

describe "Customers Endpoints" do
  it "shows all a customer's subsciptions (active and cancelled)" do
    tea_1 = Tea.create!({ title: "Green Tea", description: "Savory", temperature: 80, brew_time: 3 })
    tea_2 = Tea.create!({ title: "Jasmine Tea", description: "Savory", temperature: 75, brew_time: 3 })

    customer_1 = Customer.create!({ first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", address: "123 Main St" })

    subscription_1 = Subscription.create!({ tea_id: tea_1.id, customer_id: customer_1.id, title: tea_1.title, price: 12, frequency: 1, status: 0 })
    subscription_2 = Subscription.create!({ tea_id: tea_2.id, customer_id: customer_1.id, title: tea_2.title, price: 15, frequency: 2, status: 1 })

    headers = { "Content-Type" => "application/json", accept => 'application/json' }

    get "/api/v1/customers/#{customer_1.id}", headers: headers

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json_response = JSON.parse(response.body)
    expect(json_response['data']['id']).to eq(customer_1.id.to_s)
    expect(json_response['data']['type']).to eq('customer')
    expect(json_response['data']['attributes']['first_name']).to eq(customer_1.first_name)
    expect(json_response['data']['attributes']['last_name']).to eq(customer_1.last_name)
    expect(json_response['data']['attributes']['email']).to eq(customer_1.email)
    expect(json_response['data']['attributes']['address']).to eq(customer_1.address)
    expect(json_response['included']).to be_a(Array)
    expect(json_response['included'][0]['id']).to eq(subscription_1.id.to_s)
    expect(json_response['included'][1]['id']).to eq(subscription_2.id.to_s)
  end
end
