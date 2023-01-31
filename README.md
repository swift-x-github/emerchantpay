# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## create Authorize transaction
curl -X POST http://localhost:3000/api/transactions -H "Content-Type: application/json" -d '{"user_id": 1, "amount": 500, "customer_email": "client@yahoo.com", "customer_phone": "380672300708", "type": "Authorize", "notification_url": "http://localhost:3000/api/clients" }'

## create Capture transaction
curl -X POST http://localhost:3000/api/transactions -H "Content-Type: application/json" -d '{"transaction_id": "790420b3-994d-4961-a721-8abfc9b0e27d", "amount": 500, "type": "Capture" }'


## create Refund transaction
curl -X POST http://localhost:3000/api/transactions -H "Content-Type: application/json" -d '{"transaction_id": "6c6bf421-ff3a-4749-a326-7df47e62a50d", "amount": 500, "type": "Refund" }'
