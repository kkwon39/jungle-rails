require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.create(name: 'Books')
  subject {
    described_class.new(name: 'Harry Potter', price: 30, quantity: 10, category_id: category.id)
  }

  describe 'Validations' do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:quantity) }

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it { should belong_to(:category) }

  end
end
