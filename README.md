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
curl -X POST http://localhost:3000/api/transactions -H "Content-Type: application/json" -d '{"transaction_id": "77ecce6e-feeb-42f8-a8f6-6d0fd09ccb9a", "amount": 500, "type": "Capture" }'


## create Refund transaction
curl -X POST http://localhost:3000/api/transactions -H "Content-Type: application/json" -d '{"transaction_id": "b4383457-929f-46d3-872a-bb4a8f22ea20", "amount": 100, "type": "Refund" }'

## create Void transaction
curl -X POST http://localhost:3000/api/transactions -H "Content-Type: application/json" -d '{"transaction_id": "1a33fdef-3ff2-48b6-a55d-ade359624a68", "type": "Void"}'