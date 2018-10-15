require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      first_name: 'Test',
      last_name: 'Test',
      email: 'test@test.com',
      password: '12345678',
      password_confirmation: '12345678'
      )
  }

  describe "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(8)}
    it { should have_secure_password }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "New User" do
    it "should be valid with matching password and password confirmation" do
      expect(subject).to be_valid
    end

    it "should not be valid when password and password confirmation doesn't match" do
      subject.password_confirmation = '24681234'
      expect(subject).to_not be_valid
    end
  end

    describe '.authenticate_with_credentials' do

      before do
        @user = User.create!(
          first_name: 'Test',
          last_name: 'Test',
          email: 'test@test.com',
          password: '12345678',
          password_confirmation: '12345678'
          )
      end

      it "should return user if crednetials are correct" do
        auth = User.authenticate_with_credentials('test@test.com', '12345678')
        expect(auth).to eql(@user)
      end

      it "should return nil if credentials are wrong" do
        auth = User.authenticate_with_credentials('test@test.com', '00000000')
        expect(auth).to be_nil
      end

      it "should return user even if spaces exist before/after email" do
        auth = User.authenticate_with_credentials(' test@test.com ', '12345678')
        expect(auth).to eql(@user)
      end

      it "should be case insensitive for email" do
        auth = User.authenticate_with_credentials(' TeSt@test.COM ', '12345678')
        expect(auth).to eql(@user)
      end

  end
end
