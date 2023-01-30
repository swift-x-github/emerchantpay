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
curl -X POST http://localhost:3000/api/transactions -H "Content-Type: application/json" -d '{"user_id": 1, "amount": 60000, "customer_email": "client@yahoo.com", "customer_phone": "380672300708", "type": "Authorize", "notification_url": "http://localhost:3000/api/clients" }'

## create Capture transaction
curl -X POST http://localhost:3000/api/transactions -H "Content-Type: application/json" -d '{"transaction_id": "9317c9cd-2c42-4986-9a2c-4acac20aa1f0", "amount": 60, "type": "Capture" }'
