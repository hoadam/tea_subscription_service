# README

## Tea Subscription API
This API is built for a tea subscription service that requires 3 endpoints:
- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer's tea subscription
- An endpoint to see all of a customer's subscription (active and cancelled)

### Prerequisites
- Ruby (version >= 3.2.2)
- Rails (version >= 7.1.3.2)
- PostgreSQL

### Installation
1. Clone the repository:

    ```bash
    git clone <repository_url>
    ```

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Set up the database:

    ```bash
    rails db:{drop,create,migrate,seed}
    ```
## RESTful Endpoints
```
GET /api/v1/customers/:customer_id/subscriptions

POST /api/v1/customers/:customer_id/subscriptions

DELETE /api/v1/customers/:customer_id/subscriptions/:subscription_id

![tea_sub_db](https://github.com/hoadam/tea_subscription_service/assets/13019517/ba548575-891d-4cac-8517-2e77dcb5937f)

