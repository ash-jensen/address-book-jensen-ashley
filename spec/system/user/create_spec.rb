require 'rails_helper'

RSpec.describe 'create user', type: :system do
  # User should not be created when email and password are left empty
  scenario 'empty email and password' do
    # 1 Visit Sign Up page
    visit sign_up_path

    # 2 Click Sign Up button, email and password fields are left empty
    click_button 'Sign Up'

    # 3 The page should show alert "You must enter a valid email and a password."
    expect(page).to have_content("You must enter a valid email and a password.")

    # 4 User should not be created
    expect(User.count).to eq(0)
  end
  
  # User should not be created when valid email IS present, password IS NOT present
  scenario 'valid email with no password' do
    # 1 Visit Sign Up page
    visit sign_up_path

    # 2 Fill in email field with valid email, password field left empty
    fill_in 'user[email]', with: 'test@email.com'

    # 3 Click Sign Up button
    click_button 'Sign Up'
    
    # 4 The page should show alert "You must enter a valid email and a password."
    expect(page).to have_content("You must enter a valid email and a password.")

    # 5 User should not be created
    expect(User.count).to eq(0)
  end

  # User should not be created when valid email IS NOT present, password IS present
  scenario 'valid password with no email' do
    # 1 Visit Sign Up page
    visit sign_up_path

    # 2 Fill in password field with password, email field left empty
    fill_in 'user[password]', with: 'password'

    # 3 Click Sign Up button
    click_button 'Sign Up'
    
    # 4 The page should show alert "You must enter a valid email and a password."
    expect(page).to have_content("You must enter a valid email and a password.")

    # 5 User should not be created
    expect(User.count).to eq(0)
  end

  # User created with valid email and password
  scenario 'valid email and password' do
    # 1 Visit Sign Up page
    visit sign_up_path

    # 2 Fill in email field with valid email, password field with a password
    fill_in 'user[email]', with: 'test@email.com'
    fill_in 'user[password]', with: 'password'

    # 3 Click Sign Up button
    click_button 'Sign Up'
    
    # 4 You should be taken to people page where message "User created." is displayed
    expect(page).to have_content("User created.")

    # 5 A new user is created
    expect(User.count).to eq(1)
    
    # 6 Check that the last user created has an email of "test@email.com"
    expect(User.last.email).to eq('test@email.com')
  end
end