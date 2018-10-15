require 'rails_helper'

RSpec.feature "Logins", type: :feature, js: true do
  before :each do
   @user = User.create!(
      first_name: 'Test',
      last_name: 'Test',
      email: 'test@test.com',
      password: '12345678',
      password_confirmation: '12345678'
   )
  end

  scenario "Cart increased amount to 1" do

    visit '/login'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Sign In'
    # commented out b/c it's for debugging only
    save_screenshot

    expect(page).to have_text @user.first_name
  end
end
