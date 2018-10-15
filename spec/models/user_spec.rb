require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      first_name: 'Test',
      last_name: 'Test',
      email: 'test@test.com',
      password: '1234',
      password_confirmation: '1234'
      )
  }

  describe "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "New User" do
    it "should be valid with matching password and password confirmation" do
      expect(subject).to be_valid
    end
  end
end
