# Jungle Rails

Demonstation of ability working on an existing code base and new language (Ruby) based on a mini e-commerce application built with Rails 4.2. Implemented a range tests using rspec.

## Added Features
- Sold-out badge
- Added categories for products
- Created User and Review model to support multiple features
    - User authntication; hashed password using bcrypt
    - Reviews and ratings with relations between models
- Bug-fixes
- Basic http authentication for admins
- Allowed admins to add products and categories under new namespace

## Screenshots

!['HomePage'](https://github.com/RayKayy/rainforest-rails/blob/master/docs/Home.png?raw=true)
!['AdminProductPage'](https://github.com/RayKayy/rainforest-rails/blob/master/docs/admin-product.png?raw=true)
!['EmptyCart'](https://github.com/RayKayy/rainforest-rails/blob/master/docs/empty-cart.png?raw=true)
!['OrderConfirmation'](https://github.com/RayKayy/rainforest-rails/blob/master/docs/order-confirm.png?raw=true)
!['Product'](https://github.com/RayKayy/rainforest-rails/blob/master/docs/product.png?raw=true)
!['PurcahsePop'](https://github.com/RayKayy/rainforest-rails/blob/master/docs/purchase.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
