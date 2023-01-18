require 'rails_helper'

RSpec.describe 'read user', type: :system do
  # Sign in with an account that is already created
  scenario 'sign in with existing email and password' do
    # 1 Visit Sign Up page
    visit sign_up_path

    # 2 Sign up by filling email field with valid email, password field with a password
    fill_in 'user[email]', with: 'test@email.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign Up'
    
    # 3 You should be taken to people page where message "User created." is displayed
    expect(page).to have_content("User created.")

    # 4 Sign Out 
    click_on 'Sign Out'

    # 5 Sign In to existing user account
    fill_in 'session[email]', with: 'test@email.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Sign In'
    
    # 6 DB is searched for correct credentials, redirect to people page where message "Sign in Successful." is displayed
    expect(page).to have_content("Sign in Successful.")
  end
end