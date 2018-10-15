require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.create!(name: 'Books')
      @product1 = Product.create!(name: 'Harry Potter', price: 30, quantity: 10, category_id: @category.id)
      @product2 = Product.create!(name: 'Avatar', price: 25, quantity: 15, category_id: @category.id)
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!(name: 'The Shack', price: 20, quantity: 100, category_id: @category.id)
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'test@test.com',
        total_cents: 300,
        stripe_charge_id: '123abc',
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price,
        total_price: @product1.price * 2
      )
      @order.line_items.new(
        product: @product2,
        quantity: 3,
        item_price: @product2.price,
        total_price: @product2.price * 3
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eql(8)
      expect(@product2.quantity).to eql(12)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      expect(@product3.quantity).to eql(100)
    end
  end
end